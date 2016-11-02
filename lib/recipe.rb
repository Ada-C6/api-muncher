class Recipe
  attr_reader :label, :image, :url, :ingredients, :calories, :difficultylevel, :healthlabels, :dietlabels, :servings

  def initialize(label, options = {} )
    raise ArgumentError if label == nil || label == ""

    @label = label

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @difficultylevel = options[:difficultylevel]
    @healthlabels = options[:healthlabels]
    @dietlabels = options[:dietlabels]
    @servings = options[:servings]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  class << self
    attr_reader :recipes
  end

  def self.all(keyword = nil, page = 0)
    @recipes ||= EdamamApiWrapper.listrecipes(keyword, page)
  end

  def self.reset
    @recipes = nil
  end

  def self.by_label(label)
    self.all.select{ |r| r.label == label }.first
  end
end
