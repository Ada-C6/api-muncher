class SearchesController < ApplicationController
  def index
    @results
  end

  def show
    @recipe ||= EdamamApiWrapper.listrecipe(params[:id])
  end

  def new; end

  # class << self
  #   attr_writer :results
  # end

  def create
    @results ||= EdamamApiWrapper.listrecipes(params[:search_word])
    render :index
  end

end
