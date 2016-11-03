class RecipesController < ApplicationController

  def home; end

  def index
    @recipes = Recipe.search(params[:search])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
