class RecipeSearchController < ApplicationController

  def index
    @query = params[:query]
    @data = SearchResult.all(@query).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = SearchResult.all(params[:id])
  end

end
