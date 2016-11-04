class RecipesController < ApplicationController
  def show
    @page = 'nonhomepage'
    @recipe = Edamam_Api_Wrapper.getrecipe(params[:id])
  end
end
