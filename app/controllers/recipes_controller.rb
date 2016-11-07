class RecipesController < ApplicationController
  def search
    session.delete(:query)
  end

  def index
    params[:search] ||= session[:query]
    session[:query] = params[:search]
    @page = (params[:page] || 1).to_i
    @recipes, @count = EdamamWrapper.all_results(session[:query], @page)
    @total_pages = ((@count.to_i + 9) / 10) || 1
  end

  def show
    @recipe = EdamamWrapper.find(params[:id])
  end
end
