class HomepagesController < ApplicationController
  def index
    @searched = Recipe.search(params[:search])
    return @searched
  end

  def search
    # distinction to decide if it is being passed a uri in the search bar. If it is, then .search will not work because .search_recipe in the api_wrapper doesn't work with uri's since it includes from/to which limits the search to key words.
    if params[:search] =~ /\d/
      # need to define it as an array because the view page assumes that it is. This avoids creating multiple view pages based on the keyword search. 
      @searched = []
      @searched << Recipe.by_uri(params[:search])
    else
      @searched = Recipe.search(params[:search])
    end
    # render json: @searched
    # @list = Recipe.page params[:page]
    # render json: @list
  end

  def show
    @recipe = Recipe.by_uri(params[:recipe])
  end
end
