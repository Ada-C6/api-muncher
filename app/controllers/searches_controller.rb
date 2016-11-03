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

  def next
    params[:search_index] = params[:search_index].to_i + 10

    @search_index = params[:search_index]
    @search_word = params[:search_word]

    @results ||= EdamamApiWrapper.nextpage(@search_index, @search_word)

    render :index
  end

end
