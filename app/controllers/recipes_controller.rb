class RecipesController < ApplicationController
  def index
    if @searchterm.nil?
      @searchterm = params[:searchterm]
      @page = params[:page].to_i
      Recipe.reset
      @recipes = Recipe.all(@searchterm, @page)
    else
      # If there is a :searchterm, I want to use this search to narrow down the results by
      # diet label
      @recipes = Recipe.search(params[:dietlabels])
    end
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end

  def next
    @searchterm = params[:searchterm]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.all(@searchterm, @page)
    render :index
  end
end
