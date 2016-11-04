require 'faker'

class HomepagesController < ApplicationController
  def search

  end

  def index
    if params[:next]
      params[:from] = params[:next].to_i + 12
      params[:to] = params[:next].to_i + 24
    elsif params[:back]
      params[:from] = params[:back].to_i - 12
      params[:to] = params[:back].to_i
    else
      params[:from] = 0
      params[:to] = 12
    end

    if params[:search_term]
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], params[:from], params[:to])
      # @recipes[0].ingredients
      @total = EdamamApiWrapper.total_recipes(params[:search_term])
    else
      @word = Faker::SlackEmoji.food_and_drink #This is the only food faker, but it returns slack formatted words, i.e. :pot_pie:
      @word = @word.gsub(/[:_]/, ':' => '', '_' => ' ')
      # @word = @word.tr("_", ' ')
      # @word = @word.tr(":", ''); @word.strip!
      @recipe = EdamamApiWrapper.list_recipes(@word, 0, 1)
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:id])
    @servings = @recipe.servings.round
    @calories = @recipe.calories.round/@servings
    @nutrition_info = @recipe.nutrition_info
  end
end
