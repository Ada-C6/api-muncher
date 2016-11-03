require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe_list.rb"

class HomepagesController < ApplicationController
  def index
    if params[:from] == nil
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], 0)
      params[:from] = 10
      params[:to] = params[:from] + 10
    else
      params[:from] = params[:from].to_i
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], params[:from])
      params[:from] += 10
      params[:to] = params[:from]+10
    end
  end

  def results
    if params[:from] == nil
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], 0)
      params[:from] = 10
      params[:to] = params[:from] + 10
    else
      params[:from] = params[:from].to_i
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], params[:from])
      params[:from] += 10
      params[:to] = params[:from]+10
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
  #   if @recipe != nil && @recipe != []
  #     render status: :created
  #   else
  #     render status: :service_unavailable
  #   end
  end
end
