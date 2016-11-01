class Recipe
  attr_reader :name, :recipe_image, :source_url, :ingredients, :calories, :dietary_info, :yield, :source, :source_icon

  def initialize(name, options = {} )
    raise ArgumentError if name == nil || name == ""

    @name = name
    @image = options[:image]
    @source_url = options[:source_url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @dietary_info = options[:dietary_info]
    @yield = options[:yield]
    @source = options[:source]
    @source_icon = options[:source_icon]
  end

  class << self
    attr_reader :recipes
  end

  def self.all
    @recipes ||= EdamamApiWrapper.recipe_search(search_term)
  end

  def self.reset
    @recipes = nil
  end
end
