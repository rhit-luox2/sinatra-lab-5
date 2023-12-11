ENV['SINATRA_ENV'] ||= "development"
SINATRA_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require './app/controllers/application_controller'

# Equivalent to `require_all 'app/controllers'`
Dir[SINATRA_ROOT + "/app/controllers/**"].each do |file|
  require file
end
