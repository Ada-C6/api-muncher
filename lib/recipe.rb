require_relative 'recipe_api_wrapper'

class Recipe

  attr_reader :id, :label, :photo, :url, :ingredients, :diet

  def initialize(id, label, photo, url, ingredients, diet)
    raise ArgumentError if id == nil || label == nil || photo == nil || url == nil || ingredients == nil || diet == nil

    @id = id
    @label = label
    @photo = photo
    @url = url
    @ingredients = ingredients
    @diet = diet
  end

  class << self
    attr_reader :recipes, :recipe
  end

  # def self.all(search_term, page_number)
  def self.all(search_term)
    #reset_all #TO-DO: clear the previous search all session, but this make my 'back to index' page not working anymore
    #reset_all now will go to the 'home' method in controller.
    # @recipes ||= EdamamApiWrapper.list_recipes(search_term, page_number)
    @recipes ||= EdamamApiWrapper.list_recipes(search_term)
  end

  def self.search_by(id)
    reset_one #clear the previous show one session
    @recipe ||= EdamamApiWrapper.list_a_recipe(id)
  end

  def self.reset_all
    @recipes = nil
  end

  def self.reset_one
    @recipe = nil
  end
end
