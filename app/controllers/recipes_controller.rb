class RecipesController < ApplicationController
  def index
    @result = Recipe.all
  end
end
