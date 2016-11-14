class Recipe
  attr_reader :name, :image, :uri, :url, :ingredients, :dietinfo, :nutrients, :daily

  def initialize(name, image, uri, url=nil, ingredients=nil, dietinfo=nil, nutrients=nil)

    @name = name
    @image = image
    @uri = URI.encode(uri)
    @url = url
    @ingredients = ingredients
    @dietinfo = dietinfo
    @nutrients = nutrients
    @daily = daily

  end

end
