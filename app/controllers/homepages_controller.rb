class HomepagesController < ApplicationController
  def index
  end

  def recipe
    if params[:search]
      @recipes = paginate EdamamApiWrapper.list_recipes(params[:search]), per_page: 10
      # @q = params[:search]
    # else
    #   @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end
end
