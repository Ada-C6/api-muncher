class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(params["search"])
  end

  def show
    # label = params[:search]
    id = params[:id]
    @recipe = Recipe.find(id)
  end
end
