class RecipesController < ApplicationController
  def show
    @page = 'nonhomepage'
    @recipe = Edamam_Api_Wrapper.getrecipe(params[:id])
    @from = params[:from]
    @query = params[:query]

    if !@recipe
      flash[:notice] = "Sorry, that recipe could not be found. Please try a new search!"
      redirect_to recipefinders_index_path
    end
    
  end
end
