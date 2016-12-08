class Recipe
  attr_reader :label, :link, :ingredients, :photo, :uri, :health, :ingredients, :id

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""
    @label = label
    @photo = options[:photo]
    @link = options[:link]
    @uri = options[:uri]
    @health = options[:health]
    @ingredients = options[:ingredients]
    @id = @uri.split("_").last
  end

  def self.search(string, page)
    EdamamApiWrapper.search_recipes(string, page)
  end

  def self.hit_counts(string)
    EdamamApiWrapper.count(string)
  end

  def self.by_uri(uri)
    return EdamamApiWrapper.one_recipe(uri).first
  end
end
