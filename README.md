## autonumeric-rails

Wrap up the excellent autoNumeric.js javascript library

autoNumeric is a jQuery plugin that automatically formats currency (money) and numbers as you type on form inputs.
It supports most International numeric formats and currency signs including those used in Europe, North and 
South America, Asia and India (lakhs**).

autoNumeric.js github repository and documentation [https://github.com/BobKnothe/autoNumeric] (https://github.com/BobKnothe/autoNumeric)

autoNumeric.js home page and settings generator [http://www.decorplanit.com/plugin] (http://www.decorplanit.com/plugin)

The autonumeric-rails simply wrap up autoNumeric.js and in addition provides ujs flavor to autoNumeric.js

## Installation

Add this line to your application's Gemfile:

    gem 'autonumeric-rails'

And then execute:

    $ bundle

Then add in your `javascript.js` manifest:

    //= require jquery
    //= require autonumeric

## Usage

Simply add `data-autonumeric` attribute to your HTML tag to initialize autoNumeric  
with its default values:

    <%= form_for @model do |f| %>
        <%= f.text_field :field, data: {autonumeric: true} %>
    <% end %>

You can also pass autoNumeric configuration parameters directly with a Hash in your HTML tag:

    <%= form_for @model do |f| %>
        <%= f.text_field :field, data: {autonumeric: {aSign: 'USD ', mDec: 0}} %>
    <% end %>
    
See autoNumeric pages (links above) for all details on configuration and options

## Dynamic fields (AJAX and friends)

When a new fields with autonumeric attributes are generated after the DOM is loaded, either created by JavaScript
function or resulting of an AJAX call, you must manually refresh in order to initialize those new fields.

To do so you must trigger the `refresh_autonumeric` event on `document` after you modified the DOM:

    $(document).trigger('refresh_autonumeric');

## Internal

Autonumeric-rails creates in the DOM an hidden input with the same name as the text field.
On each modification of the test field value, the hidden input is updated with the sanitized value.
When validating the form the hidden form value is naturally sent to the server as it is located after the text field.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
