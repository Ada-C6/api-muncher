class RecipesController < ApplicationController
  # after_action :has_recipes, only: [:next_page]

  def index
    # Recipe.reset
    @query = params["q"]
    @page = params["page"]

    if @query == ""
      flash[:error] = "Please enter a search term."
      redirect_to recipes_path
    else
      @recipes = Recipe.all(@query, @page)
    end
  end

  def show
    @recipe = Recipe.by_uri(params[:data][:uri])
  end

  def next_page
    @page = params["data"]["page"].to_i + params["data"]["page_num"].to_i
    @query = params["data"]["query"]
    @recipes = Recipe.all(@query, @page)
  end

end
