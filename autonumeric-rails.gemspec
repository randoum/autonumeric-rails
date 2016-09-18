# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autonumeric/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'autonumeric-rails'
  spec.version       = Autonumeric::Rails::VERSION
  spec.authors       = ['randoum']
  spec.email         = ['randoum@gmail.com']
  spec.summary       = %q{autoNumeric.js library with an ujs flavor, ready-to-use for rails.}
  spec.description   = %q{autoNumeric.js library automatically formats currency and numbers. With an ujs flavor it is now directly usable in a rails project. All credits for autoNumeric.js library its-self go to its creator BobKnothe}
  spec.homepage      = 'https://github.com/randoum/autonumeric-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = `git ls-files -- test/*`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'jquery-rails', '>= 2.0.2'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rails', '~> 4.2.0'
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rspec-html-matchers'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'selenium-webdriver', '2.53.4'
  spec.add_development_dependency 'headless'
end
