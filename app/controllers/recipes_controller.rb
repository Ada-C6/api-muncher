class RecipesController < ApplicationController

  def index
    @search_term = params[:search]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
  end

  def next
    @search_term = params[:search]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
    render :index
  end

  # Lead on a possible bug fix.
  # .../index
  # .../index?search=chocolate

  def show
    # Did not realize after extracting the uri number that it could be a direct search result.
    # (Was trying to save it as an id, then couldn't get it to map correctly.) So used this solution instead.
    @recipe = Recipe.by_name(params[:id])
  end
end
