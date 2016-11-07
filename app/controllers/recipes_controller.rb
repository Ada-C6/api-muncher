class RecipesController < ApplicationController

  def home
    if params[:search].present? && !params[:search].empty?
      name = params[:search]
      redirect_to recipes_search_path(name)
    end
  end

  def index
    #if params page is nil return one.
    @page = (params[:page] || 1).to_i
    search = params[:search]
    from = (@page - 1) * 10
    to = from + 10

    @data = Recipe.search(search, from, to)
    @recipe = @data[0]
    @count = @data[1]
    @end = @count <= to || @page == 10

    if @recipe.empty?
      flash.now[:notice] = "Sorry, no recipes to show."
    end
  end

  def show
    name = params[:search]
    id = params[:id]
    @recipe = Recipe.get_recipe_id(id)

    if (@recipe.empty?)
      flash[:notice] = "Sorry, can't find a recipe with that id."
      redirect_to root_path
    end
  end
end
