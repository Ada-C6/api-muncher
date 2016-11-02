class Recipe
  def initialize(recipe_info)
    @name = recipe_info[:name]
    @photo = recipe_info[:photo]
    @url = recipe_info[:url]
    @ingredients = recipe_info[:ingredients]
    @dietary_labels = recipe_info[:dietary_labels]
  end
end
