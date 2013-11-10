/**
 * autonumeric_ujs.js
 * @author: randoum
 * @version: 0.1.9.15 - 2013-08-17
 *
 * Created by Robert J. Knothe on 2010-10-25. Please report any bugs to https://github.com/randoum/autonumeric-rails
 *
 * Wrap-up autoNumeric.js library to be used with Rails in a UJS flavor
 * All credits for autoNumeric library goes to its original creators
 * Whom can be reached at https://github.com/BobKnothe/autoNumeric
 *
 * The MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

jQuery(function() {
    var auto_numeric_init, update_numeric_value;
    update_numeric_value = function(input) {
        input.next().val(input.autoNumeric('get'));
    };
    auto_numeric_init = function(input) {
        var hidden;
        hidden = $('<input>').attr('type', 'hidden').attr('id', input.attr('id') + '_val').attr('name', input.attr('name'));
        hidden.insertAfter(input);
        input.autoNumeric('init', $.parseJSON(input.attr('data-autonumeric')));
        input.on('keyup', function() {
            update_numeric_value(input);
        });
    };
    $('input[data-autonumeric]').each(function() {
        auto_numeric_init($(this));
    });
});
