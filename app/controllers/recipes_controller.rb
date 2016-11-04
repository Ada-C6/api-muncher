class RecipesController < ApplicationController
  def index
    @searchterm = params[:searchterm]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.search(@searchterm, @page)
    labels = params[:dietlabels]
    if !labels.nil?
      @recipes = Recipe.search_label(labels, @recipes)
    end
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end

  def next
    @searchterm = params[:searchterm]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.search(@searchterm, @page)
    render :index
  end
end
