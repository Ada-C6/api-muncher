require 'will_paginate/array'

class RecipesController < ApplicationController
   def index
     @ingredient = params[:name]
   end

   def search
      @ingredient = params[:name]
      @page = 1
      @recipes = EdamamApiWrapper.find_recipes(@ingredient).paginate(:page => params[:page], :per_page => 10)
   end

   def show
     @recipe = Recipe.recipe_look_up(params[:uri])
   end
end
