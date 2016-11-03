class RecipeList
  attr_reader :label, :image, :uri, :url, :ingredientLines, :total_yield, :calories, :totalNutrients

  def initialize(label, image, uri, url, ingredientLines = nil, total_yield = nil, calories = nil, totalNutrients = nil)

    if label == nil || image == nil || uri == nil || url == nil || uri == "" || url == "" || image == "" || label == ""
       raise ArgumentError
    end

    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredientLines = ingredientLines
    @total_yield = total_yield
    @calories = calories
    @totalNutrients = totalNutrients

  end

end
