class PagesController < ApplicationController
  def home
    # This is to clear previous search_all result
    Recipe.reset_all
  end

  def index
    recipes ||= Recipe.all(params[:q])
    @recipes_array = Kaminari.paginate_array(recipes).page(params[:page]).per(10)
    Recipe.set_page(params[:page])
  end

  def show
    @recipe ||= Recipe.search_by(params[:id])
  end

end
