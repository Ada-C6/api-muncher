require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe_list.rb"

class HomepagesController < ApplicationController
  def index
    @results = EdamamApiWrapper.list_recipes(params[:search_term])

    # if @data != nil && @data != []
    #   render status: :created
    # else
    #   render status: :service_unavailable
    # end
  end

  def results

    @results = EdamamApiWrapper.list_recipes(params[:search_term])

  end

  # def show
  #   @recipe = EdamamApiWrapper.show_recipe
  #   if @recipe != nil && @recipe != []
  #     render status: :created
  #   else
  #     render status: :service_unavailable
  #   end
  # end
end
