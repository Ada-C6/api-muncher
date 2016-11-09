class Recipe
  attr_reader :label, :image, :url, :dietLabels, :healthLabels, :ingredientLines, :uri

  def initialize(label, image, url, dietLabels, healthLabels, ingredientLines, uri)
    @label = label
    @image = image
    @url = url
    @dietLabels = dietLabels
    @healthLabels = healthLabels
    @ingredientLines = ingredientLines
    @uri = uri
  end

end
