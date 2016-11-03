class RecipesController < ApplicationController

  def search; end

  def index
    @search_term = params["search"]
    page = params["page"]
    Recipe.search(@search_term, page)
    @results = Recipe.results
    @count = Recipe.count
    @pages = @count/10
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
    results = Recipe.results
    unless results == nil
      @recipe = results.find do |result|
        result.uri == params[:id]
      end
      return @recipe
    end
    
  end
end
