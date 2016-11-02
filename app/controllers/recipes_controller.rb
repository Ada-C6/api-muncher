class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(params[:keyword])
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end
end
