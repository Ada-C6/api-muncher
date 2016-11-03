class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @page = params[:page].to_i
    # reset memoization before searching so the user doesn't always get chicken
    Recipe.reset
    @recipes = Recipe.all(@keyword, @page)
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end

  def next
    @keyword = params[:keyword]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@keyword, @page)
    render :index
  end

end
