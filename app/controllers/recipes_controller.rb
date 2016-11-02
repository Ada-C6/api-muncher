class RecipesController < ApplicationController
  # after_action :has_recipes, only: [:next_page]

  def index
    @query = params["q"]
    @page = params["page"]
    # @recipes = EdamamApiWrapper.listrecipes(@query, @page)
    @recipes = Recipe.all(@query, @page)
  end

  def next_page
    @page = params["data"]["page"].to_i + params["data"]["page_num"].to_i
    @query = params["data"]["query"]
    # @recipes = EdamamApiWrapper.listrecipes(@query, @page)
    @recipes = Recipe.all(@query, @page)
  end

  def show
    @recipe = Recipe.by_label(params[:id])
    # raise

    # recipe = params["recipe"]
    # @name = recipe["label"]
    # @photo = recipe["image"]
    # @link = recipe["url"]
    # @ingredients = recipe["ingredients"]
    # @dietary_info = recipe["dietLabels"]
  end
end
