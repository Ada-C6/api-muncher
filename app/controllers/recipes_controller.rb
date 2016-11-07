class RecipesController < ApplicationController
  def index
    @search_results = Edamam_Api_Wrapperp.search_recipes(@search_term)
  end

  def create
  end

  def new
  end

# https://api.edamam.com/search?q=chicken&app_id=f2222748&app_key=776b85ac416c71fed03e509eafa77715

  def search
    # what is better string or symbol?
#you might be able take count

    @search_term = params[:query]

    @search_results = Edamam_Api_Wrapper.search_recipes(@search_term).paginate(:page => params[:page], :per_page => 10)
    @total_count = @search_results.length 

    render :search

  end

  def show
    uri = params[:uri]
    @recipe = Edamam_Api_Wrapper.get_recipe(uri)

    render :show
  end


end
