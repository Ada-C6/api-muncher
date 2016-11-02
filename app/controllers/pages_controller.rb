class PagesController < ApplicationController

  def index
    @recipe = params[:recipe]
  end

  def show
    @recipe = params[:recipe]
  end




private


#params
end
