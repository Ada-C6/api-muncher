class RecipeList
  attr_reader :label, :image, :url

  def initialize(label, image, url)
    @label = label
    @image = image
    @url = url
    # @health_labels = health_labels
    # @ingredients = ingredients
  end

end
