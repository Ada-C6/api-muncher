require "recipe"
require "httparty"

class RecipesController < ApplicationController


  def search
    @data = Recipe.all(params[:q], params[:base])
  end

  def index
      random = ["chicken", "beef", "protein", "lasagne", "pasta", "low-fat"].shuffle
        5.times do |data|
        @data = Recipe.all(params[random], params[:base])
      end
  end



  def show
    @data = Recipe.find(params[:label], params[:base])
    if @data == nil
      return failed
    end
  end

  def popular
    # if there is time i will implement this function
    #   @data = Recipe.find(params[:saved])
  end
end
