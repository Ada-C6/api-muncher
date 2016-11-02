class RecipesController < ApplicationController
  def index
    # reset memoization before searching so the user doesn't always get chicken
    Recipe.reset
    @recipes = Recipe.all(params[:keyword])
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end
end
