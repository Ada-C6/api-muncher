require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"

class HomepagesController < ApplicationController
  def index
  end

  def results
    if params[:from] == nil
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], 0)
      params[:from] = 10
      params[:to] = params[:from] + 10
      render :layout => "results"
    else
      params[:from] = params[:from].to_i
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], params[:from])
      params[:from] += 10
      params[:to] = params[:from]+10
      render :layout => "results"
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
    render :layout => "results"
  end
end
