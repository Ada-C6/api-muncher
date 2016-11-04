class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@keyword, @page)

    # save the user's recent searches.
    # Hash prevents duplicates
    session[:searches] ||= {}
    session[:searches][@keyword] ||= true

    @searches = session[:searches]

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
