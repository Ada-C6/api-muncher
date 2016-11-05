
class Recipe

  attr_reader :name, :uri, :url, :image, :description, :source, :source_icon, :servings, :diet_labels, :health_labels, :ingredients_block, :ingredients, :calories, :total_nutrients, :total_daily, :digest

  def initialize(recipe_hash)

    if recipe_hash['label'] == nil || recipe_hash['uri'] == nil || recipe_hash['label'] == "" || recipe_hash['uri'] == "" || recipe_hash['ingredients'] == nil || recipe_hash['ingredients'].length == 0 || recipe_hash['source'] == nil || recipe_hash['source'] == ""
      raise ArgumentError
    end

    @name = recipe_hash['label']
    @url = recipe_hash['url']

    @uri = ""
    start_uri = false

    recipe_hash['uri'].each_char do |char|
      if char == "_"
        start_uri = true
      end

      if start_uri
        @uri << char
      end
    end

    if @uri == nil || @uri == ""
      raise ArgumentError
    end

    @servings = recipe_hash['yield']
    @image = recipe_hash['image']
    @source = recipe_hash['source']
    @source_icon = recipe_hash['sourceIcon']
    @diet_labels = recipe_hash['dietLabels']
    @health_labels = recipe_hash['healthLabels']
    @ingredients_block = recipe_hash['ingredientLines']
    @ingredients = recipe_hash['ingredients']
    @calories = recipe_hash['calories']
    @total_nutrients = recipe_hash['totalNutrients']
    @total_daily = recipe_hash['totalDaily']
    @digest = recipe_hash['digest']
    @description = CopyWriter.get_description(@ingredients, @source)

  end

end
