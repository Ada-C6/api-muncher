require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    # this displays the search page (non-restful).
  end

  def results
  @recipes = Recipe.all(params[:search]).paginate(:page => params[:page], :per_page => 10)
    if @recipes == []
      flash[:no_results] = "Sorry! Your search term did not find any results."
    end
  end

  def show
    #this displays an individual recipe 
    @recipe = Recipe.find_recipe(params[:identifier])

    if @recipe == nil
      flash[:no_results] = "Sorry! we can't find this recipe."
    end
  end

  def about; end
end
