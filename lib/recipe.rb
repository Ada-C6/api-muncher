class Recipe
  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self; attr_reader :recipes, :recipes_hash end

  attr_reader :label, :id, :image, :original_site, :original_url, :ingredients,
      :diet_labels, :health_labels

  def initialize(label, id, options = {} )
    raise ArgumentError if label == nil || label == "" || id == nil || id == ""

    @label = label
    @id = id

    @image         = options[:image]
    @original_site  = options[:original_site]
    @original_url  = options[:original_url]
    @ingredients   = options[:ingredients]
    @diet_labels   = options[:diet_labels]
    @health_labels = options[:health_labels]
  end

  # Return a set of all recipes
  def self.all(keyword = nil, page = 0)
      @recipes = EdamamApiWrapper.list_recipes(keyword, page)
      self.add_to_hash(@recipes)
      return @recipes
  end

  # Used to reset so a new search will return different results
  def self.reset
    @recipes = nil
  end

  def self.add_to_hash(result)
    @recipes_hash ||= {}
    result.each do |recipe|
      @recipes_hash[recipe.id] = recipe
      end
  end

  # Return the recipe matching
  # the given id.
  def self.by_id(id)
    if @recipes_hash[id].nil?
      return EdamamApiWrapper.list_recipes(id, 0)
    else
      return @recipes_hash[id]
    end
  end

end
