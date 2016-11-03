class Recipe
  attr_reader :label, :uri, :photo, :link, :ingredients, :dietary_info

  def initialize(label, photo, uri, options = {})
    raise ArgumentError if label == nil || label == "" || photo == nil || photo == "" || uri == nil || uri == ""

    @label = label
    @photo = photo
    @uri = uri
    @link = options[:link]
    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
  end

  class << self
    attr_reader :recipes
  end

  def self.all(keyword = nil, page = 0)
    @recipes = EdamamApiWrapper.listrecipes(keyword, page)
    return @recipes
  end

  def self.reset
    @recipes = nil
  end

  def self.by_uri(uri)
    # USE URI TO SEARCH
    #self.recipes
    matches = self.recipes.select do |recipe|
      recipe.uri == uri
      # raise
    end
    return matches.first
  end
end
