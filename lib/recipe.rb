class Recipe

  attr_reader :label, :image, :url, :ingredients, :diet_labels

  def initialize(label, options = {})

    @label = label

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
  end

  class << self
    attr_reader :recipes
  end

  def self.all
    @recipes ||= EdamamApiWrapper.search_recipe(search_term)
  end

  def self.reset
    @recipes = nil
  end
end
