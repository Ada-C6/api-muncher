class RecipeSearchController < ApplicationController

  def index
    @query = params[:query]
    @data = SearchResult.all(@query)

    #@data = EdamamApiWrapper.list_search_results(@query)
  end

  def show
  end

end
