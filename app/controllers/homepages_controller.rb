class HomepagesController < ApplicationController
  def index
  end

  def recipe
    # @recipes = Recipe.all
    if params[:search]
      @recipes = EdamamApiWrapper.list_recipes(params[:search])
      # @q = params[:search]
    # else
    #   @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end
end
