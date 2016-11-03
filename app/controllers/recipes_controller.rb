class RecipesController < ApplicationController
   def index
     @ingredient = params[:name]
   end

   def search
      @ingredient = params[:name]
      @recipes = EdamamApiWrapper.find_recipes(@ingredient)
   end

   def show
     @recipe = Recipe.recipe_look_up(params[:name])
   end
end
