class RecipesController < ApplicationController

  def search; end

  def index
    @search_term = params["search"]
    Recipe.search(@search_term)
    @results = Recipe.results
  end

  def show
    results = Recipe.results
    @recipe = results[params[:id].to_i]
  end
end
