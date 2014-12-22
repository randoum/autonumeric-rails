/**
 * autonumeric_ujs.js
 * @author: randoum
 * @version: 1.9.27 - 2014-12-22
 *
 * Created by Randoum on 2013-08-15. Please report any bugs to https://github.com/randoum/autonumeric-rails
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

var AutonumericRails;

window.AutonumericRails = AutonumericRails = (function() {
    AutonumericRails.create_autonumeric_object = function(obj) {
        if (!obj.data('autonumeric-initialized')) {
            return new this(obj);
        }
    };

    function AutonumericRails(field) {
        this.field = field;
        this.field.data('autonumeric-initialized', true);
        this.create_hidden_field();
        this.init_autonumeric();
        this.sanitize_value();
        this.field.on('keyup blur', $.proxy(function() {
            this.sanitize_value();
        }, this));
    }

    AutonumericRails.prototype.create_hidden_field = function() {
        this.hidden = $('<input>').attr('type', 'hidden').attr('id', this.field.attr('id') + '_val').attr('name', this.field.attr('name'));
        this.hidden.insertAfter(this.field);
    };

    AutonumericRails.prototype.init_autonumeric = function() {
        this.field.autoNumeric('init', $.parseJSON(this.field.attr('data-autonumeric')));
    };

    AutonumericRails.prototype.sanitize_value = function() {
        this.hidden.val(this.field.autoNumeric('get'));
    };

    return AutonumericRails;

})();

window.refresh_autonumeric = function() {
    $('input[data-autonumeric]').each(function() {
        AutonumericRails.create_autonumeric_object($(this));
    });
};

jQuery(function() {
    window.refresh_autonumeric();
    $(document).on('refresh_autonumeric', function() {
        window.refresh_autonumeric();
    });
    $(document).on('ajaxComplete', function() {
        window.refresh_autonumeric();
    });
});
