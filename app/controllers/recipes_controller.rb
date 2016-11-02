class RecipesController < ApplicationController
  def show
    @recipe = Edamam_Api_Wrapper.getrecipe(params[:id])
  end
end
