class RecipesController < ApplicationController

  def home; end

  def index
    @page = (params[:page] || 1).to_i # default so you dont have to set it in the url each time
    @recipes = EdamamApiWrapper.search(params[:search], @page)


  end

  def show
    @recipe = EdamamApiWrapper.find(params[:id])
  end

end
