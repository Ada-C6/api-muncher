class Recipe
  attr_reader :name, :photo, :link, :ingredients, :dietary_info

  def initialize(name, options = {})
    raise ArgumentError if name == nil || name == ""

    @name = name
    # @photo = photo

    # @dietary_info = options[:dietLabels]

end
