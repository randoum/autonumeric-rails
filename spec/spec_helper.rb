ENV['RAILS_ENV'] ||= 'test'
LOCAL_PLATFORM = (Gem::Platform.local.os == 'darwin' ? :mac : :linux)
SPEC_ROOT = File.expand_path('..', __FILE__)

# Load environment
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'

# Requires support files
Dir[Rails.root.join(SPEC_ROOT, 'support/**/*.rb')].each { |f| require f }

# Load database cleaner
require 'database_cleaner'

# Load capybara and its dependencies
require 'capybara/rspec'
require 'capybara/rails'
require 'selenium-webdriver'
require 'headless'

# Set firefox path
Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Firefox::Binary.path = firefox_path
  cap = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
  Capybara::Selenium::Driver.new app,
                                 browser: :firefox,
                                 desired_capabilities: cap
end

# Capybara to consider hidden elements
Capybara.ignore_hidden_elements = false

RSpec.configure do |config|
  # Focus
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true

  # Let database cleaner do the DB cleaning job
  config.use_transactional_fixtures = false

  # Infer anonymous controllers
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order
  config.order = 'random'

  # Database cleaner config
  config.before(:suite) {
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  # Headless for selenium driver
  if LOCAL_PLATFORM == :linux
    config.before(:each, js: true) {
      headless = Headless.new
      headless.start
      at_exit { headless.destroy }
    }
  end
end
