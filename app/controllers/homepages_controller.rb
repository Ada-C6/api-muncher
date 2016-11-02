class HomepagesController < ApplicationController
  def index
    @searched = Recipe.search(params[:search])
  end

  def main
    @searched = Recipe.search(params[:search])
  end

  def search
    # @q = "%#{params[:query]}%"
    # @recipies = Recipe.where("label LIKE ?", @q)
    @searched = Recipe.search(params[:search])
  end
end
