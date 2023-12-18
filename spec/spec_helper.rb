ENV['SINATRA_ENV'] = 'test'
SINATRA_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require_relative '../config/environment'
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.expect_with(:rspec) { |c| c.syntax = [:expect, :should] }
end

# The rest of this configuration is specific to integration testing, and would
# normally be in a file that is only required by the integration tests.
# However, since we are only writing integration tests for this app,
# I am including it here so that you can see all of the configuration in one
# place.
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
# NOTE: Change the javascript_driver to :selenium_chrome_headless
# once you've gotten over the novelty of seeing your tests run live!
Capybara.javascript_driver = :selenium_chrome_headless
Capybara.save_path = 'tmp'

# This is here to correct a bug around saving the screenshots in the appropriate
# tmp directory.  This bit of configuration is not normally required.
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  "../../tmp/"+"screenshot_#{example.description.gsub(' ', '-').gsub(/^.*\/spec\//,'')}"
end

RSpec.configure do |config|
  config.include Capybara
end
