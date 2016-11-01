class Recipe
  attr_reader :name, :photo, :link, :ingredients, :dietary_info

  def initialize(name, photo, link, options = {})
    raise ArgumentError if name == nil || name == "" || photo == nil || photo == "" || link == nil || link == ""

    @name = name
    @photo = photo
    @link = link
    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
  end
end
