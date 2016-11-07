class Recipe

  attr_reader :label, :image, :url, :ingredients, :diet_labels, :uri

  def initialize(recipe_hash)

    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @url = recipe_hash[:url]
    @ingredients = recipe_hash[:ingredients]
    @diet_labels = recipe_hash[:diet_labels]
    @uri = recipe_hash[:uri]
  end

  class << self
    attr_reader :recipes
    attr_reader :recipe_hash
  end

  def self.all(search_term)
    @recipes ||= EdamamApiWrapper.search_recipe(search_term)
    return @recipes
  end

  def self.reset
    #Need to figure out how to reset between searches
  end

  def self.find(id)
    if @recipes_hash[id].nil?
      EdamamApiWrapper.search_recipe(id)
    else
      return @recipes_hash[id]
    end
  end
end
