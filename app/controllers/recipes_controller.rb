class RecipesController < ApplicationController

  def home; end

  def index
    @recipes = Recipe.search(recipe_params[:search_term])
  end

  def show
    @recipe =
  end

  private
  def recipe_params
    params.require(:recipe).permit(:search_term)
  end
end
