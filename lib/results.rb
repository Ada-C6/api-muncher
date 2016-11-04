
class Recipe_Results
  attr_reader :recipe_name, :recipe_uri, :image, :url, :ingredients, :diet_labels, :health_labels

  def initialize(recipe_name, recipe_uri, image, ingredientLines, url, diet_labels, health_labels )

    if recipe_name == nil || recipe_uri == nil || recipe_name == "" || recipe_uri == ""
      raise ArgumentError
    end
    @recipe_name = recipe_name
    @recipe_uri = recipe_uri
    @image = image
    @ingredients = ingredientLines
    @url = url
    @diet_labels = diet_labels
    @health_labels = health_labels
  end

end
