class RecipesController < ApplicationController
  # def index
  #     @data = Recipe.search(params[:recipe_params])
  # end
  def index
  @recipes = Recipe.search(params[:search])
  end
#
#   private
#
#   def recipe_params
#   params.require(:recipe).permit(:name)
# end
end
