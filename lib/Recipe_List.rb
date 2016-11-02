class RecipeList
  attr_reader :label, :image, :uri, :health_labels, :ingredients

  def initialize(label, image, uri, health_labels, ingredients)
    @label = label
    @image = image
    @uri = uri
    @health_labels = health_labels
    @ingredients = ingredients
  end

end
