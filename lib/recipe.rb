require 'httparty'
require 'edamam_api_wrapper.rb'

class Recipe
  attr_reader :name, :id, :image, :source, :ingredients, :url

  def initialize(name, id, options = { })
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id.split("_")[1]

    @image = options[:image]
    @source = options[:source]
    @ingredients = options[:ingredients]
    @url = options[:url]
  end

end
