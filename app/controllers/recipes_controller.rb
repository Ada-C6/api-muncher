

class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
        @recipes = paginate EdamamApiWrapper.search(params[:q], 0, 100), per_page: 10 
    end
  end



  def show
    @recipe = EdamamApiWrapper.show_details(params[:uri])
  end
end
