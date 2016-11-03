class Recipe
  attr_reader :name, :photo, :url, :ingredients, :dietary_labels, :calories, :uri

  def initialize(recipe_info)
    @name = recipe_info[:name]
    @uri = recipe_info[:uri]
    @photo = recipe_info[:photo]
    @url = recipe_info[:url]
    @ingredients = recipe_info[:ingredients]
    @dietary_labels = recipe_info[:dietary_labels]
    @calories = recipe_info[:calories]
    # @summary = recipe_info[:summary] since summary is not always provided, comment out
  end

  def self.search(searched_term) #finds results for one search
    EdamamApiWrapper.search(searched_term)
  end


end
