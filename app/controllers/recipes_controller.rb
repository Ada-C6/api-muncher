class RecipesController < ApplicationController

  def index
    # @next_page = 0
    @query_string = "0"
    if params[:search]
      @recipes = Recipe.search(params[:search], params[:startindex])
      # @next_page = params[:startindex].to_i + 10
      # @search = params[:search]
      @query_string = "#{(params[:startindex].to_i + 10)}?search=#{params[:search]}"
      
      @back_query_string = "#{(params[:startindex].to_i - 10)}?search=#{params[:search]}"
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
