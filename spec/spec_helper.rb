ENV['RAILS_ENV'] ||= 'test'

# Load environment
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'
#require 'rspec/autorun'

# Requires support files
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Load database cleaner
require 'database_cleaner'

# Load capybara and its dependencies
require 'capybara/rspec'
require 'capybara/rails'
require 'headless'

# Capybara to consider hidden elements
Capybara.ignore_hidden_elements = false

RSpec.configure do |config|
  # Use fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

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
  config.before(:each, js: true) {
    headless = Headless.new
    headless.start
    at_exit { headless.destroy }
  }
end
