require 'faker'
require 'awesome_print'

class HomepagesController < ApplicationController

  def index
    paginate #helper method at bottom
    if params[:search_term]
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term], params[:from], params[:to])
      @total = get_total(@recipes)
      page_number_display_helper(@recipes)
    else
      @word = random_food_search_term
      @recipe = EdamamApiWrapper.list_recipes(@word, 0, 1)
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:id])
    @servings = @recipe.servings
    @calories = @recipe.calories/@servings
    @nutrition_info = @recipe.nutrition_info
  end

  def get_total(recipes)
    total = EdamamApiWrapper.total_recipes(params[:search_term])
    total = total - total.to_i/10 #Change if I request a different number each page. Total is off by 1 yeach request?
    if total > (params[:from] + recipes.length) && (params[:from] + recipes.length) < params[:to] # there is a problem with at the end occasionally too
      total = (params[:from] + recipes.length)
    end
    return total
  end

  def random_food_search_term
    word = Faker::SlackEmoji.food_and_drink #This is the only food faker, but it returns slack formatted words, i.e. :pot_pie:
    word = word.gsub(/[:_]/, ':' => '', '_' => ' ')
    return word
  end

  def paginate
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
  end

  def page_number_display_helper(recipes)
    if recipes.length == 0
      params[:first_recipe] = params[:from]
    else
      params[:first_recipe] = params[:from]+1
    end
    params[:last_recipe] = params[:from] + @recipes.length
  end
end
