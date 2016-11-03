class RecipesController < ApplicationController
  # def index
  #     @data = Recipe.search(params[:recipe_params])
  # end
  def index
    @recipes = Recipe.search(params[:search])
  end

  def show
    # params
    # raise
    @recipe = Recipe.search(params[:id]).first
  end
end
