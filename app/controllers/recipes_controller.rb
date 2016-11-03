class RecipesController < ApplicationController
  def index
    # raise
    # puts params[:q]
    EdamamApiWrapper.search_results(params[:q])
  end

  def show
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
