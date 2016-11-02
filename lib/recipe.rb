class Recipe
  attr_reader :name, :photo, :original_link, :ingredients, :diet_labels
  
  def initialize(recipe_hash)
    @name = recipe_hash[:name]
    @photo = recipe_hash[:photo]
    @original_link = recipe_hash[:original_link]
    @ingredients = recipe_hash[:ingredients] #array
    @diet_labels = recipe_hash[:diet_labels] #array
  end

  def self.search(input)
    EdamamApiWrapper.search(input)
  end
end
