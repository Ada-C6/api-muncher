require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/results.rb"



class HomepagesController < ApplicationController
  def index
    @recipe = params[:search]
  end

  def show
  end

  def list
    @recipes = EdamamApiWrapper.listresults(params["search"])
    if @recipes != nil && @recipes != []
      render status: :created
    else
      render status: :service_unavailable
    end
  end
end
