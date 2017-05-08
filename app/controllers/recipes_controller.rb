class RecipesController < ApplicationController

  def search; end

  def index
    @search_term = params["search"]
    @page = params["page"]
    Recipe.search(@search_term, @page)
    @results = Recipe.results
    if Recipe.count == 0
      @pages = 1
      @count = 0
    elsif Recipe.count > 100
      @count = 100
      @pages = 10
    else
      @count = Recipe.count
      @pages = (@count/10.0).ceil
    end
    # raise
  end

  def show
    @recipe = Recipe.find(params[:id])
    @dietary_info = @recipe.dietary_info
  end

end
