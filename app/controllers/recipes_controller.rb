class RecipesController < ApplicationController

  def index
    @search_term = params[:search]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
    if @recipes != []
      @total_recipe_num = @recipes.first.total_recipe_num
    end

    if @total_recipe_num > 100
      @more_items_after = true
    end
  end

  def pagination
    @search_term = params[:search]
    @page = params[:page].to_i + params[:page_num].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
    if @recipes != []
      @total_recipe_num = @recipes.first.total_recipe_num
    end

    if @total_recipe_num > 100
      @more_items_after = true
    end

    render :index
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end
end
