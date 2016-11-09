require "#{Rails.root}/lib/muncher_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"

class RecipesController < ApplicationController

  def index; end

  def list
    @query = params[:query]

    @data = MuncherApiWrapper.get_recipes(@query)

    if @data != nil
      @data = @data.paginate(:page => params[:page], :per_page => 10)
    end

    if @query.to_s.strip == ''
      redirect_to root_path, notice: "You must search for something before we can give you recipes!"
    end
  end


  def show
    @params = params[:uri]
    @recipe = MuncherApiWrapper.show_recipe(@params)
  end

end
