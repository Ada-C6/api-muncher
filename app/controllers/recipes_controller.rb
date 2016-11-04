require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @ingredient = params[:search_term]
    @recipes = Recipe.search(@ingredient).paginate(:page => params[:page])
    # @page = 1
    # @recipes = Recipe.by_ten(@ingredient, @page)
  end

  def show
    @recipe = Recipe.by_uri(params[:uri])
    @Page = params[:page]
    @all_indgredients = @recipe.ingredientLines
    @yield = @recipe.yield.to_i
  end
end
