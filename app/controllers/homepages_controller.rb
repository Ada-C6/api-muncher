require "#{Rails.root}/lib/edamam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe_list.rb"

class HomepagesController < ApplicationController
  def index
    @data = EdamamApiWrapper.list_recipes

    if @data != nil && @data != []
      render status: :created
    else
      render status: :service_unavailable
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe
    if @recipe != nil && @recipe != []
      render status: :created
    else
      render status: :service_unavailable
    end
  end
end
