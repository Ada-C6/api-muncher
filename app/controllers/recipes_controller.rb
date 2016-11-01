class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.listrecipes(params[:searchterm])
  end

  def show
    @recipe = EdamamApiWrapper.listrecipes(params[:searchterm])
  end
end
