require 'will_paginate/array'

class RecipesController < ApplicationController
  before_action :find_ingredient, except:[:show]

  def index; end

  def search
    @recipes = EdamamApiWrapper.find_recipes(@ingredient).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = Recipe.recipe_look_up(params[:uri])
  end

  private

  def find_ingredient
    @ingredient = params[:name]
  end

end
