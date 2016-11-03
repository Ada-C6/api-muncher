class RecipesController < ApplicationController

  def search; end

  def index
    @search_term = params["search"]
    @page = params["page"]
    Recipe.search(@search_term, @page)
    @results = Recipe.results
    @count = Recipe.count - 1
    @pages = (@count/10.0).ceil
    # raise
  end
  #
  # def page
  #   # raise
  #   page = params["page"]
  #   @search_term = params["search"]
  #
  #   Recipe.search(@search_term, page)
  #   @results = Recipe.results
  #   # until to >= Recipe.count
  #   #   from += 10
  #   #   to += 10
  #   #   Recipe.search(@search_term, from, to)
  #   #   @results = Recipe.results
  #   # end
  # end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
