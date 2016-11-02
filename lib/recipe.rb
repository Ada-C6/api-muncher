class Recipe
  attr_reader :name, :recipe_image, :id, :source_url, :ingredients, :calories,  :yield, :source, :source_icon #, :dietary_info

  def initialize(name, options = {})
    raise ArgumentError if name == nil || name == ""

    @name = name
    @recipe_image = options[:recipe_image]
    @id = options[:id]
    @source_url = options[:source_url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    # @dietary_info = options[:dietary_info]
    @yield = options[:yield]
    @source = options[:source]
    @source_icon = options[:source_icon]
  end

  class << self
    attr_reader :recipes
  end

  def self.all(search_term = nil)
    @recipes ||= EdamamApiWrapper.recipe_search(search_term)
  end

  def self.reset
    @recipes = nil
  end

  def self.by_name(name)
    self.all.select{|r| r.name == name }.first
  end

end
