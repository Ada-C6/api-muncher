ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'

require 'vcr'
require 'webmock/minitest'

require "minitest/reporters"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...


  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

  VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
  config.hook_into :webmock # tie into this other tool called webmock
  config.default_cassette_options = {
    :record => :new_episodes    # record new data when we don't have it yet
  }

  config.filter_sensitive_data("<API_ID>") do
  ENV['API_ID']
  end

  config.filter_sensitive_data("<API_KEY>") do
  ENV['API_KEY']
  end
	end
	
end
