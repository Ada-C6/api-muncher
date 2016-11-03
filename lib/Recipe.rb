class Recipe
  attr_reader :name, :image, :uri, :url, :ingredients, :dietinfo

  def initialize(name, image, uri, url=nil, ingredients=nil, dietinfo=nil)

    @name = name
    @image = image
    @uri = URI.encode(uri)
    @url = url
    @ingredients = ingredients
    @dietinfo = dietinfo

  end

end
