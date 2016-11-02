class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all(params[:search])
    # Figure out how to save results to app and/or get it to be in show.
  end

  def show
    @recipe = Recipe.by_name(params[:id])
  end
end
