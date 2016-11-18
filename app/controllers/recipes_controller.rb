class RecipesController < ApplicationController
  def index
    if params[:q].present?
      @data = paginate EdamamApiWrapper.search(params[:q]), per_page: 12
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])

  end

  ######## may use for additional features
  # def new
  # end
  #
  # def create
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
end
