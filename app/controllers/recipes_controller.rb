class RecipesController < ApplicationController

  def search; end

  def index
    @search_term = params["search"]
    page = params["page"]
    Recipe.search(@search_term, page)
    @results = Recipe.results
    @count = Recipe.count
  end

  def page
    raise
    @results = Recipe.results
    until to >= @count
      from += 10
      to += 10
      Recipe.search(@search_term, from, to)
      @results = Recipe.results
    end
  end

  def show
    results = Recipe.results
    @recipe = results[params[:id].to_i]
  end
end
