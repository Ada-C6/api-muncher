require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @ingredient = params[:search_term]
    @recipes = Recipe.search(@ingredient).paginate(:page => params[:page], :per_page => 10)
    # @page = 1
    # @recipes = Recipe.by_ten(@ingredient, @page)
  end

  def show
    @recipe = Recipe.by_uri(params[:uri])
  end
end
