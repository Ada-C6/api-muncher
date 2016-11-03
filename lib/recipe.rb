class Recipe
  attr_reader :label, :photo, :link, :ingredients, :dietary_info

  def initialize(label, photo, link, options = {})
    raise ArgumentError if label == nil || label == "" || photo == nil || photo == "" || link == nil || link == ""

    @label = label
    @photo = photo
    @link = link
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

  def self.by_url(url)
    # USE URI TO SEARCH
    matches = all.select do |recipe|
      recipe.link == url
    end
    return matches.first
  end
end
