class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @page = params[:page].to_i
    @recipes = Recipe.all(@keyword, @page)
    @searches = add_search_to_session(@keyword)
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end

  def next
    @keyword = params[:keyword]
    @page = params[:page].to_i
    @recipes = Recipe.all(@keyword, @page)
    @searches = add_search_to_session(@keyword)
    render :index
  end

  private

  def add_search_to_session(keyword)
    # save the user's recent searches.
    # Hash prevents duplicates
    session[:searches] ||= {}
    session[:searches][keyword] ||= true
    session[:searches]
  end

end
