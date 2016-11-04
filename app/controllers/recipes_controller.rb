class RecipesController < ApplicationController
  include RecipesHelper

  def home; end

  def index
    @page = (params[:page] || 1).to_i # default so you dont have to set it in the url each time
    @count, @recipes = EdamamApiWrapper.search(params[:search], @page)

    @total_pages = total_pages(@count) #used to determine if links to next 10/previous 10 will show up
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:id])

    if @recipe == nil
      redirect_to no_recipe_path
    end
  end

  def no_recipe; end

end
