class SearchesController < ApplicationController
  def index
    @results
    @search_word
    @search_index
  end

  def show
    @recipe ||= EdamamApiWrapper.listrecipe(params[:id])
  end

  def new; end

  def create
    @results ||= EdamamApiWrapper.listrecipes(params[:search_word])
    @search_word = params[:search_word]
    @search_index = 0
    render :index
  end

  def page
    @search_index = params[:search_index]
    @search_word = params[:search_word]

    @results ||= EdamamApiWrapper.page(@search_index, @search_word)

    render :index
  end

end
