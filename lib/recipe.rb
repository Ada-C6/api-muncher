class Recipe
  attr_reader :more_items_after, :total_recipe_num, :name, :id, :recipe_image, :source_url, :ingredients, :calories, :dietary_info, :descriptive_labels, :yield

  def initialize(options = {})
    @more_items_after = options[:more_items_after]
    @total_recipe_num = options[:total_recipe_num]
    @name = options[:name]
    raise ArgumentError if @name == nil || @name == ""

    @id = options[:id]
    @recipe_image = options[:recipe_image]
    @source_url = options[:source_url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @dietary_info = options[:dietary_info]
    @descriptive_labels = options[:descriptive_labels]
    @yield = options[:yield]
  end

  class << self
    attr_reader :recipes
    attr_reader :recipes_hash
  end

  def self.all(search_term = nil, page = 0)
    @recipes = EdamamApiWrapper.recipe_search(search_term, page)
    @recipes_hash ||= {}
    @recipes.each do |recipe|
      @recipes_hash[recipe.id] = recipe
    end
  end

  def self.reset
    @recipes = nil
  end

  def self.by_id(id, page = 0)
    if @recipes_hash[id].nil?
      EdamamApiWrapper.recipe_search(id, page)
    else
      return @recipes_hash[id]
    end
  end
end
