class HomepagesController < ApplicationController
  def index
    @searched = Recipe.search(params[:search])
    return @searched
  end

  def search
    @searched = Recipe.search(params[:search])

    @searched.each do |recipe|
      @link = recipe.link
      @photo = recipe.photo
    end
    return @searched
  end

  def show
    # @show_recipe = Recipe.by_name(params[:search])
    # return @show_recipe
    @recipe = Recipe.by_label(params[:recipe])
  end
end
