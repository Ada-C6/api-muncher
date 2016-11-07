class PagesController < ApplicationController
  def home
    # This is to clear previous search_all result
    # Recipe.reset_all
  end

  def index
    all_results = EdamamApiWrapper.list_recipes(params[:q])
    @recipes = Kaminari.paginate_array(all_results).page(params[:page]).per(10)
    @query = params[:q]
    @page = params[:page]


    # recipes ||= Recipe.all(params[:q])
    # @recipes_array = Kaminari.paginate_array(recipes).page(params[:page]).per(10)
    # Recipe.set_page(params[:page])
  end

  def show
    # @recipe ||= Recipe.search_by(params[:id])
    @recipe = EdamamApiWrapper.list_a_recipe(params[:id])
    @query = params[:q]
    @page = params[:page]
  end

end
