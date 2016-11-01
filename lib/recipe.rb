class Recipe
  attr_reader :name, :photo, :link, :ingredients, :dietary_info

  def initialize(options = {})
    # raise ArgumentError if name == nil || name == ""

    @name = options[:name]
    @photo = options[:photo]
    @link = options[:recipe_link]
    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
  end
end
