require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/results.rb"


class HomepagesController < ApplicationController
  def index
    @recipe = params[:search]
  end

  def show
    params

    recipe_search = EdamamApiWrapper.listresults(params["format"].split("_")[1])
    @recipe = recipe_search.last
  end

  def list
    @recipes = EdamamApiWrapper.listresults(params["search"])
    if @recipes != nil && @recipes != []
      render status: :list
    else
      render status: :service_unavailable
    end
  end
end
