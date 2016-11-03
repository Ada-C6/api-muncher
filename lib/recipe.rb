class Recipe
  attr_accessor :name, :photo, :original_link, :ingredients, :diet_labels, :uri

  def initialize(recipe_hash)
    @name = recipe_hash[:name]
    @photo = recipe_hash[:photo]
    @original_link = recipe_hash[:original_link]
    @ingredients = recipe_hash[:ingredients] #array
    @diet_labels = recipe_hash[:diet_labels] #array
    @uri = recipe_hash[:uri]
  end

  def self.search(input)
    EdamamApiWrapper.search(input)
  end

  def self.find(id) #takes in a Recipe object
    EdamamApiWrapper.find(id)
  end
end
