class RecipesController < ApplicationController
  def index
    @page = (params[:page] || 1).to_i
    @last_page = 10
    @recipes = Recipe.all(params["search"], @page)
  end

  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end
end
