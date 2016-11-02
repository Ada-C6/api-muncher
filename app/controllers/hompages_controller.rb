require "#{Rails.root}/lib/edemam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"


class HompagesController < ApplicationController
  # the results will be shown through the index page:
  def index

  end

  # landing page where one can search for a recipe, paramaters will be brought in through a form:
  def new
      @search = EdemamApiWrapper.request_recipes(params[:search_term])
  end

  # the search results will be stored into a variable:
  def create
  end

end
