class RecipeSearchController < ApplicationController

  def index
    @query = params[:query]
    @data = SearchResult.all(@query)
  end

  def show
    @recipe = SearchResult.all(params[:id])
  end

end
