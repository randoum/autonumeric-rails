## autonumeric-rails

Wrap up the excellent autoNumeric.js javascript library

autoNumeric is a jQuery plugin that automatically formats currency (money) and numbers as you type on form inputs.
It supports most International numeric formats and currency signs including those used in Europe, North and 
South America, Asia and India (lakhs**).

autoNumeric.js github repository and documentation [https://github.com/BobKnothe/autoNumeric] (https://github.com/BobKnothe/autoNumeric)

autoNumeric.js home page and settings generator [http://www.decorplanit.com/plugin] (http://www.decorplanit.com/plugin)

The autonumeric-rails simply wrap up autoNumeric.js and in addition provides ujs flavor to autoNumeric.js

- [Installation](#installation)
- [Usage](#usage)
- [AJAX](#ajax)
- [Internal](#internal)
- [Changes](#changes)

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

## AJAX

autonumeric-rails looks for `ajaxComplete` events which are trigger by jQuery every time an Ajax request finishes.
As a result, rails-ujs elements (i.e. `data-remote` elements) now automatically initialize autonumeric fields after the AJAX request is complete.

## Javascript DOM manipulation

When a Javascript function generate and add to the DOM new fields with autonumeric attributes,
you must manually refresh in order to initialize those new fields.

To do so you must trigger the `refresh_autonumeric` event on `document` after you modified the DOM:

    $(document).trigger('refresh_autonumeric');

## Internal

Autonumeric-rails creates in the DOM an hidden input with the same name as the text field.
On each modification of the text field value (through the `keyup` event), the hidden input is updated with the sanitized value.
When validating the form, the hidden field value is sent to the server as it is located after the text field in the DOM.

## Changes

For a full list of change, see the CHANGELOG.ms file

### 1.9.22
Bind on `ajaxComplete` event, so each jQuery ajax event automatically refresh autonumeric fields. Manually triggering `refresh_autonumeric` is not necessary for rails-ujs (i.e `data-remote`) anymore

### 1.9.18.1
Implement `refresh_autonumeric` event on `document` for manual update after the DOM has been modified

### 1.9.18.0
First attempt to implement automatic refresh of autonumeric fields using `DOMNodeInserted`.
This was not cross-browser compatible and was quickly reverted
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
