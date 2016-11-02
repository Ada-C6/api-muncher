class RecipesController < ApplicationController
  def index
    #this displays the search page (non-restful).
  end

  def results
    #this displays the results of the search?
  @recipes = Recipe.all(params[:search])
  end

  def show
    #this displays an individual recipe (need to figure out if going to use an ID or use a combo of recipe name/source or the URI?)
    @recipe = Recipe.recipe(params[:identifier])
  end
end
