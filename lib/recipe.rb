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
    attr_reader :recipes, :current_page
  end


  def self.all(search_term)
    @recipes ||= EdamamApiWrapper.list_recipes(search_term)
  end

  def self.search_by(id)
    @recipe = @recipes.select{ |r| r.id == id }.first
  end

  def self.reset_all
    @recipes = nil
    @current_page = 0
  end

  def self.set_page(page_number)
    @current_page = page_number
  end

end
