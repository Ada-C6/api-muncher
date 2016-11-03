class Recipe
  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self; attr_reader :recipes end

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

  # Return a memoized set of all recipes
  def self.all(keyword = nil, page = 0)
    @recipes ||= EdamamApiWrapper.list_recipes(keyword, page)
  end

  # Used to reset the memoization so a new search will return different results
  def self.reset
    @recipes = nil
  end

  # Return either the first (probably only) recipe matching
  # the given id, or nil.
  def self.by_id(id)

    matches = self.all.select do |r|
      r.id == id
    end
    return matches.first
  end

end
