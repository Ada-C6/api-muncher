class Recipe
  attr_reader :label, :image, :url, :ingredients, :calories, :level, :healthLabels, :dietLabels

  def initialize(label, options = {} )
    raise ArgumentError if label == nil || label == ""

    @label = label

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @level = options[:level]
    @healthLabels = options[:healthLabels]
    @dietLabels = options[:dietLabels]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  class << self
    attr_reader :recipes
  end

  def self.all(keyword = nil)
    @recipes ||= EdamamApiWrapper.listrecipes(keyword)
  end

  def self.reset
    @recipes = nil
  end

  def self.by_label(label)
    self.all.select{ |r| r.label == label }.first
  end
end
