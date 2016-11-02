class RecipesController < ApplicationController
   def index
     @ingredient = params[:recipe]
   end

   def show
      @ingredient = params[:recipe]
     @recipes = EdamamApiWrapper.find_recipies(@ingredient)
   end
end
