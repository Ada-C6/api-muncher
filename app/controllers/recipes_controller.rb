class RecipesController < ApplicationController
  # def index
  #     @data = Recipe.search(params[:recipe_params])
  # end
  def index #can we store all recipes in another variable?
    @recipes = Recipe.search(params[:search])
  end

  def show
    @recipe = Recipe.search(params[:id]).first
  end
end
