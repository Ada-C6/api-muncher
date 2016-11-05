class RecipesController < ApplicationController

  def index
    @search_term = params[:search]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
  end

  def pagination
    @search_term = params[:search]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
    render :index
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end
end
