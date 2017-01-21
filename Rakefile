begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

Bundler::GemHelper.install_tasks