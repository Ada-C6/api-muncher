require "edamam_api_wrapper.rb"
require "recipe.rb"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
