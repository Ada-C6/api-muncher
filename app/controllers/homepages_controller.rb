class HomepagesController < ApplicationController

  def search
    @keyword = params[:search]
    # distinction to decide if it is being passed a uri in the search bar. If it is, then .search will not work because .search_recipe in the api_wrapper doesn't work with uri's since it includes from/to which limits the search to key words.
    if params[:search] =~ /\d/ && params[:search].length == 32
      # need to define it as an array because the view page assumes that it is. This avoids creating multiple view pages based on the keyword search.

      redirect_to show_recipe_path(params[:search])
    else
      total_hits = Recipe.hit_counts(params[:search])
      @last_page = (total_hits/10.to_f).ceil

      @page = (params[:page] || 1).to_i

      if @page < 1
        flash[:error] = "Page number may not be less than 1"
        @page = 1
      elsif @page > @last_page
        flash[:error] = "Pages only exist when their are recipes, there are no more recipes to display."
        @page = @last_page
      end
      @searched = Recipe.search(params[:search], @page)
    end
  end

  def show
    @recipe = Recipe.by_uri(params[:recipe])
    if @recipe == nil
      flash[:notice] = "Flash workss!"
      redirect_to recipes_path
    else
      flash[:notice] = "Flash workss!"
    end
  end
end
