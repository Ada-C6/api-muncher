# lib/slack_api_wrapper.rb
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["EDAMAM_TOKEN"]
end
