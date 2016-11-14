class Recipe
  attr_reader :name, :image, :uri, :url, :ingredients, :dietinfo, :nutrients, :daily, :serving, :calories

  def initialize(name, image, uri, serving=nil, url=nil, ingredients=nil, dietinfo=nil, nutrients=nil, calories=nil)

    @name = name
    @image = image
    @uri = URI.encode(uri)
    @serving = serving
    @url = url
    @ingredients = ingredients
    @dietinfo = dietinfo
    @nutrients = nutrients
    @daily = daily
    @calories = calories

  end

end
