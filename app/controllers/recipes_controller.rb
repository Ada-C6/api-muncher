class RecipesController < ApplicationController

  # Would have liked to have used controller filters to potentially dry up index/pagination.
  # Got notice of being at 4000/5000 API calls for the month,
  # so not risking it breaking things and me going over the limit trying to fix it.
  # Would have tried to use the following controller filters:
  
  # before_action :set_search_term
  # before_action :set_total_recipe_num
  # before_action :set_more_items_after

  def index
    @search_term = params[:search]
    @page = params[:page].to_i
    Recipe.reset
    @recipes = Recipe.all(@search_term, @page)
    if @recipes != []
      @total_recipe_num = @recipes.first.total_recipe_num
    end

    if @recipes != [] && @total_recipe_num > 100
      @recipes.each do |recipe|
        @more_items_after = true
      end
    elsif @recipes != [] && @total_recipe_num <= 100
      @recipes.each do |recipe|
        @more_items_after = false
      end
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

    if @recipes != [] && @total_recipe_num > 100
      @recipes.each do |recipe|
        @more_items_after = true
      end
    elsif @recipes != [] && @total_recipe_num <= 100
      @recipes.each do |recipe|
        @more_items_after = false
      end
    end

    render :index
  end

  def show
    @recipe = Recipe.by_id(params[:id])
  end
end
