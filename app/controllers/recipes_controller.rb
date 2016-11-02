class RecipesController < ApplicationController
  

  def index

  end

  def show
  
  end

  def search
  	@term=params[:term]
  	results = MuncherApiWrapper.search(@term)
  	@paginated_results=results.paginate(:page => params[:page], :per_page => 10)
  	@recipes=Recipe.make_recipes_from_api(@paginated_results)
  end

end
