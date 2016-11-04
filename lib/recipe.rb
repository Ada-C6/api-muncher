require 'awesome_print'

class Recipe
  attr_reader :name, :id, :url, :health_labels, :diet_labels, :cautions, :instructions, :ingredients, :image, :edamam_url, :servings, :calories, :source, :nutrition_info, :count

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
      @servings = @servings.round if @servings != nil
    @calories = options[:calories]
      @calories = @calories.round if @calories != nil
    @source = options[:source]
    @nutrition_info = options[:nutrition_info]
    @count = options[:count]
  end


end
