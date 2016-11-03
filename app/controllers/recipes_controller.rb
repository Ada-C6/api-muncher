class RecipesController < ApplicationController
  def index
    if params[:q].present?
      @data = paginate EdamamApiWrapper.search(params[:q]), per_page: 10
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])

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
