require 'recipe_search_api_wrapper'
class HomepagesController < ApplicationController
  def index
  end

  def search
    @term = params[:term]
    @page = params[:page] || 1
    @page = @page.to_i

    @health_labels = []
    if params[:is_peanut_free] == "1"
      @health_labels << "peanut-free"
    end
    if params[:is_vegetarian] == "1"
      @health_labels << "vegetarian"
    end

    @diet_labels = []
    if params[:is_low_carb] == "1"
      @diet_labels << "low-carb"
    end

    @diet_labels = []
    if params[:is_high_protein] == "1"
      @diet_labels << "high-protein"
    end

    @diet_labels = []
    if params[:is_low_fat] == "1"
      @diet_labels << "low-fat"
    end

    results = RecipeSearchApiWrapper.search(@term, @page, @health_labels, @diet_labels)
    @recipes = results[:recipes]
    @count = results[:count]
    @more = results[:more]

  end

  def show
    @recipe_id= params[:uri]
    @recipe = RecipeSearchApiWrapper.find(@recipe_id)
    @ingredients = @recipe.ingredients
    @diet_labels = @recipe.dietLabels
    @health_labels = @recipe.healthLabels
  end
end
