class RecipeList
  attr_reader :label, :image, :uri, :url, :ingredientLines

  def initialize(label, image, uri, url, ingredientLines = nil)
    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredientLines = ingredientLines

  end

end
