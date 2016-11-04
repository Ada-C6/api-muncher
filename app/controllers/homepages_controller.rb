require "#{Rails.root}/lib/edemam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"


class HomepagesController < ApplicationController
  # landing page where one can search for a recipe, user inputs parameter
  def index

  end

  # new list of recipes
  def new
    @search_term = params[:search_term]
    @search_results = EdemamApiWrapper.list_recipes(params[:search_term])
  end

  # show the individual recipe(use uri as the id):
  def show
    @recipe = EdemamApiWrapper.get_a_recipe(params[:uri])
  end

end
