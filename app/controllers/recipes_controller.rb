class RecipesController < ApplicationController
  include RecipesHelper

  def home; end

  def index
    @page = (params[:page] || 1).to_i # default so you dont have to set it in the url each time
    @count, @recipes = EdamamApiWrapper.search(params[:search], @page)

    @total_pages = total_pages(@count)
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:id])
  end

end
