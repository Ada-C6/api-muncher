class RecipesController < ApplicationController

  def show
    #I think this is not dry but I'm not sure how to improve it. A before action would
    #still use the api
    #can VCR be used outside tests? maybe I'll try that...
    results = MuncherApiWrapper.search(session[:term])
    recipes=Recipe.make_recipes_from_api(results)
    @this_recipe=recipes[params[:id].to_i-1]
  end

  def search
  	@term=params[:term]
    session[:term]=@term
  	results = MuncherApiWrapper.search(@term)
    @num_results=results.count
    flash[:notice]= "No recipes matched your search term. Search again"
    
  	@paginated_results=results.paginate(:page => params[:page], :per_page => 10)
  	@recipes=Recipe.make_recipes_from_api(@paginated_results)
  end

end
