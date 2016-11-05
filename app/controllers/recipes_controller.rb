class RecipesController < ApplicationController

  def index
    @query = params["q"]
    @page = params["page"]
    @recipes = Recipe.all(@query, @page)

    if @recipes == []
      flash[:error] = "No results match your search. Please enter a valid search term."
      redirect_to root_path
    end
  end

  def show
    @recipe = Recipe.by_uri(params[:data][:uri])
  end

  def search; end

  def next_page
     @page = params["data"]["page"].to_i + params["data"]["page_num"].to_i
     @query = params["data"]["query"]
     @recipes = Recipe.all(@query, @page)
     if @recipes == []
       flash[:error] = "No more results match your search. Please enter a valid search term."
       redirect_to root_path
     end
  end

end
