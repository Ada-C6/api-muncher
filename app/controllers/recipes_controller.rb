require 'will_paginate/array'

class RecipesController < ApplicationController
  # def index
  #     @data = Recipe.search(params[:recipe_params])
  # end
  def index #can we store all recipes in another variable?
    @recipes = Recipe.search(params[:search]).paginate(:page => params[:page], :per_page => 12)
    # render :json => @recipes.to_json(:methods => [:image_url])
  end

  def show
    @recipe = Recipe.search(params[:id]).first
  end
end

# def index #will paginate?
# @posts =  Post.all.paginate(:page => params[:page], :per_page => 4)
#  render :json => @posts.to_json(:methods => [:image_url])
#  end
