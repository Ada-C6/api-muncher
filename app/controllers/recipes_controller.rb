
class RecipesController < ApplicationController


  def search

  	@keyword = params[:query]
  	@results = RecipeSearchWrapper.search_by_one_keyword(@keyword)
  	
  	unless @results == nil
  		@results = @results.paginate(:page => params[:page], :per_page => 10)
  	end

  	render :index

  end

  def index

  end

  def flip_page

  end

  def show
  	@result = RecipeSearchWrapper.show_just_one_recipe(params[:id])
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

