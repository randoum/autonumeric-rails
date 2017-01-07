require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'jquery-rails'

Bundler.require(*Rails.groups)
require 'autonumeric-rails'

module Dummy
  class Application < Rails::Application
    Rails.application.config.assets.precompile += %w[test_version_1.js test_version_2.js]
  end
end

