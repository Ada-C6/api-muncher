require 'httparty'

class Recipe

  def initialize(name, options = { })
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id

    @image = options[:image]
    @source = options[:source]
    @ingredients = options[:ingredientLines]
    @url = options[:url]
  end

end
