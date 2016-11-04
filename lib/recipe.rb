class Recipe
  attr_reader :label, :uri, :photo, :link, :ingredients, :dietary_info, :count

  def initialize(label, photo, uri, options = {})
    raise ArgumentError if label == nil || label == "" || photo == nil || photo == "" || uri == nil || uri == ""

    @label = label
    @photo = photo
    @uri = uri
    @link = options[:link]
    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
    unless options[:count] > 100
      @count = options[:count]
    else
      @count = 100
    end
  end

  @recipes = nil

  def self.all(keyword = nil, page = 0)
    @recipes = EdamamApiWrapper.listrecipes(keyword, page)
    return @recipes
  end

  # def self.reset
  #   @recipes = nil
  # end

  def self.by_uri(uri)
    unique_recipe = EdamamApiWrapper.recipe_from_uri(uri)
    matches = unique_recipe.select do |recipe|
      recipe.uri == uri
    end
    return matches.first
  end
end
