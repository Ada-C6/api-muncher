class RecipesController < ApplicationController
  def index
    @ingredient = params[:search_term]
    @recipes = Recipe.search(@ingredient)
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end
end
