
class Recipe
  attr_reader :name, :id, :url, :health_labels, :diet_labels, :cautions, :instructions, :ingredients, :image, :edamam_url, :servings, :calories, :source, :nutrition_info

  def initialize(name, id, options = {})

    if name == nil || id == nil || name == "" || id == ""
      raise ArgumentError
    end

    @name = name
    @id = id

    @url = options[:url]
    @health_labels = options[:health_labels]
    @diet_labels = options[:diet_labels]
    @cautions = options[:cautions]
    @instructions = options[:instructions]
    @ingredients = options[:ingredients]
    @image = options[:image]
    @edamam_url = options[:edamam_url]
    @servings = options[:servings]
    @calories = options[:calories]
    @source = options[:source]
    @nutrition_info = options[:nutrition_info]
  end


end
