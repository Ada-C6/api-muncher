class RecipesController < ApplicationController
  def index
    @query = params["q"]
    @page = params["page"]
    @recipe_list = EdamamApiWrapper.listrecipes(@query, @page)
  end

  def next_page
    @page = params["data"]["page"].to_i + 1
    @query = params["data"]["query"]
    @recipe_list = EdamamApiWrapper.listrecipes(@query, @page)
  end
end
