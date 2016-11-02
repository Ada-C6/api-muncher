require 'httparty'
require 'edamam_api_wrapper.rb'

class Recipe
  attr_reader :name, :image, :source, :ingredients, :url

  def initialize(name, options = { })
    raise ArgumentError if name == nil || name == ""

    @name = name

    @image = options[:image]
    @source = options[:source]
    @ingredients = options[:ingredients]
    @url = options[:url]
  end

  # def self.all(search_word)
  #   EdamamApiWrapper.listrecipes(search_word)
  # end

end
