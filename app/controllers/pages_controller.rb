class PagesController < ApplicationController



  def search
    @recipe = params[:label]
  end


  def index
    @recipe = params[:label]
    @ingredient = Recipe.search(@recipe)
  end

  def show
    @recipe = params[:label]
  end






private


#params
end
