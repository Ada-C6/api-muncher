class HomepagesController < ApplicationController
  def index
    @searched = Recipe.search(params[:search])
    return @searched
  end

  def search
    @searched = Recipe.search(params[:search])
  end

  def show
    @recipe = Recipe.search(params[:recipe]).first
  end
end
