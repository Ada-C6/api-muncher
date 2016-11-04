require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    #this displays the search page (non-restful).
  end

  def results
    #this displays the results of the search?
  @recipes = Recipe.all(params[:search]).paginate(:page => params[:page], :per_page => 10)
    if @recipes == []
      flash[:no_results] = "Sorry! Your search term did not find any results."
    end
  end

  def show
    #this displays an individual recipe (need to figure out if going to use an ID or use a combo of recipe name/source or the URI?)
    @recipe = Recipe.find_recipe(params[:identifier])

    if @recipe == nil
      flash[:no_results] = "Sorry! we can't find this recipe."
    end
  end
end
