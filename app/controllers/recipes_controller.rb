class RecipesController < ApplicationController
  def index
    # raise
    @recipes = EdamamApiWrapper.search_results(params[:q], params[:from], params[:to])
    @next_recipes = EdamamApiWrapper.search_results(params[:q], params[:from].to_i + 10, params[:to].to_i + 10)
  end

  def show
    @recipe = EdamamApiWrapper.specific_search(params[:uri])
    # raise
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
