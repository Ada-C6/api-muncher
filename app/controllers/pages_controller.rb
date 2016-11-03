class PagesController < ApplicationController
  def home
  end

  def index
    @page_number = 1
    @recipes = Recipe.all(params[:q], @page_number)
  end

  def show
  end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:label, :photo, :url, :ingredients, :diet)
  # end
end
