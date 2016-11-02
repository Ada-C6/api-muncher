class RecipesController < ApplicationController
  def index
    Recipe.reset
    @recipes = Recipe.all(params["searchterm"])
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end
end
