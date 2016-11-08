class PagesController < ApplicationController
  def home
  end

  def index
    all_results = EdamamApiWrapper.list_recipes(params[:q])
    # Kaminari gem to do the pagination magic
    @recipes = Kaminari.paginate_array(all_results).page(params[:page]).per(10)

    # These 2 instance variables are used to store the query and the index page, so that after a user finishes exploring a particular recipe, user can still go back to where user left off. (Stop at page 5 --> venture --> go back to page 5)
    @query = params[:q]
    @page = params[:page]
  end

  def show
    @recipe = EdamamApiWrapper.list_a_recipe(params[:id])

    # These 2 instance variables are used to store the query and the index page, so that after a user finishes exploring a particular recipe, user can still go back to where user left off. (Stop at page 5 --> venture --> go back to page 5)
    @query = params[:q]
    @page = params[:page]
  end

end
