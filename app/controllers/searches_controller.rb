class SearchesController < ApplicationController
  def index
    @results
    @search_word
    @search_index
    @more_pages
  end

  def show
    if params[:id].nil?
      flash[:error] = "There has been an error, please try another search term."
      redirect_to root_path
    end

    @recipe ||= EdamamApiWrapper.listrecipe(params[:id])

    if @recipe.nil?
      flash[:error] = "No results found, please try another search term."
      redirect_to root_path
    end
  end

  def new; end

  def create
    @results ||= EdamamApiWrapper.listrecipes(params[:search_word])
    @more_pages = @results.pop

    if @results.nil?
      flash[:error] = "No results found, please try another search term."
      redirect_to root_path
    else
      @search_word = params[:search_word]
      @search_index = 0
      render :index
    end
  end

  def page
    @search_index = params[:search_index]
    @search_word = params[:search_word]
    @results ||= EdamamApiWrapper.page(@search_index, @search_word)
    @more_pages = @results.pop
    render :index
  end

end
