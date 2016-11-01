require "edemam_api_wrapper"
require "recipe"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
