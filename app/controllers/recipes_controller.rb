class RecipesController < ApplicationController
  def index
    Recipe.reset
    @recipes = Recipe.all(params["searchterm"])
    # if !params[:searchterm].nil?
    #   @recipes = Recipe.paginate(:page => params[:page], :per_page => 10)
    # end
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end
end
