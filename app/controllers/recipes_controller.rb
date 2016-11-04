require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
    @recipes = Recipe.search(params[:search]).paginate(:page => params[:page], :per_page => 12)

  end

  def show
    #old search uses name
    @recipe = Recipe.search(params[:id]).first
    # @recipe = Recipe.search(params[:uri])
  end
end

# def index #will paginate?
# @posts =  Post.all.paginate(:page => params[:page], :per_page => 4)
#  end
