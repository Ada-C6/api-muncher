class RecipesController < ApplicationController
    def index
        @page = (params[:page] || 1).to_i
        if params[:search]
            @results, @total_items =             EdamamApiWrapper.search_results(params[:search], @page)
        end
        @total_pages = ((@total_items.to_i + 9) / 10) || 1
    end
  
    def show
        if params[:search].nil?
            redirect_to recipes_path
        else
            @result = EdamamApiWrapper.find_one(params[:id])
        end
    end
end
