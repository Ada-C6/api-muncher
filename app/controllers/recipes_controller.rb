class RecipesController < ApplicationController
  def index
    @searchterm = params[:searchterm]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@searchterm, @page)
    puts params
  end

  def show
    @recipe = Recipe.by_label(params[:id])
  end

  def next
    @searchterm = params[:searchterm]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.all(@searchterm, @page)
    render :index
  end
end
