class HomepagesController < ApplicationController
  def index
  end
  
  def search
    @term = params[:term]
    @recipes = RecipeSearchApiWrapper.search(@term)
  end
end
