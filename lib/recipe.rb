class Recipe
  attr_reader :label, :link, :ingredients, :photo, :uri, :health, :ingredients

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""
    @label = label
    @photo = options[:photo]
    @link = options[:link]
    @uri = options[:uri]
    @health = options[:health]
    @ingredients = options[:ingredients]
  end

  def self.search(string)
    EdamamApiWrapper.search_recipes(string)
  end

  # def self.by_label(uri)
  #   matches = EdamamApiWrapper.search_one(uri)
  #   return matches.first
  # end

end
