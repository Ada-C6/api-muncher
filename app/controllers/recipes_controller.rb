class RecipesController < ApplicationController
  def index
    # @data = EdamamApiWrapper.search(params[:q])
  end

  def search
    @data = EdamamApiWrapper.search(params[:q])
    redirect_to recipes_path
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
