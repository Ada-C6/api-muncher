class HomepagesController < ApplicationController

  def search
    # distinction to decide if it is being passed a uri in the search bar. If it is, then .search will not work because .search_recipe in the api_wrapper doesn't work with uri's since it includes from/to which limits the search to key words.
    if params[:search] =~ /\d/ && params[:search].length == 32
      # need to define it as an array because the view page assumes that it is. This avoids creating multiple view pages based on the keyword search.
      redirect_to show_recipe_path(params[:search])
    else
      @page = (params[:page] || 1).to_i
      @searched = Recipe.search(params[:search], @page)

      total_hits = Recipe.hit_counts(params[:search])
      raise
      @last_page = (total_hits/10.to_f).ceil
    end
  end

  def show
    @recipe = Recipe.by_uri(params[:recipe])
  end
end
