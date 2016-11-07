require 'httparty'
require 'edamam_api_wrapper.rb'

class Recipe
  attr_reader :name, :id, :image, :source, :ingredients, :diet_labels, :allergy_labels, :url

  def initialize(name, id, options = { })
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name

    if id.include?("_")
      @id = id.split("_")[1]
    else
      @id = id
    end

    @image = options[:image]
    @source = options[:source]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @allergy_labels = options[:allergy_labels]
    @url = options[:url]
  end

end
