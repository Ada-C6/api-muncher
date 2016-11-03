class RecipeList
  attr_reader :label, :image, :uri, :url, :ingredientLines, :yield

  def initialize(label, image, uri, url, ingredientLines = nil, yield)
    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredientLines = ingredientLines
    @yield = servings

  end

end
