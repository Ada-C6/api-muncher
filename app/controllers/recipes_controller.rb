class RecipesController < ApplicationController

  def index
    if params[:search]
      @recipes = Recipe.find(params[:search])
    end
  end

  def show
    @recipes = Recipe.find(params[:search])
  end
end
