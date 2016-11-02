class RecipesController < ApplicationController
  def index

  end

  def show
  end

  def search
  	@term=params[:term]
  	results = MuncherApiWrapper.search(@term)
  	@my_recipes=Recipe.make_recipes_from_api(results)[0..10]
  	
  	#now need to format results in view
  end
end
