class Recipe
  attr_reader :name, :id, :recipe_image, :source_url, :ingredients, :calories,  :yield, :source, :source_icon, :dietary_info

  def initialize(options = {})

    @name = options[:name]
    raise ArgumentError if @name == nil || @name == ""

    @id = options[:id]
    @recipe_image = options[:recipe_image]
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

  def self.all(search_term = nil, page = 1)
    @recipes = EdamamApiWrapper.recipe_search(search_term, page)
  end

  def self.reset
    @recipes = nil
  end

  def self.by_id(id, page = 1)
    @recipe = EdamamApiWrapper.recipe_search(id, page).first
  end
end
