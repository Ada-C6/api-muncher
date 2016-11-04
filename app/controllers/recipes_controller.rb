require "#{Rails.root}/lib/edemam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"

class RecipesController < ApplicationController
  def index
    @search_term = params[:search_term]
    @search_results = EdemamApiWrapper.list_recipes(params[:search_term])

  end

  def show

    @recipe = EdemamApiWrapper.get_a_recipe(params[:uri])
  
  end
end
