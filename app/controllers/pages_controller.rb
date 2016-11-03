class PagesController < ApplicationController
  def home
    reset = Recipe.reset_all
    # This is to clear previous search_all result
  end

  def index
    # @page_number = 1
    # @recipe = nil
    @recipes ||= Recipe.all(params[:q])
  end

  def show
    @recipe = Recipe.search_by(params[:id])
  end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:label, :photo, :url, :ingredients, :diet)
  # end
end
