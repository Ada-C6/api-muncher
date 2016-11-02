
class Recipe

  attr_reader :name, :uri, :url, :image, :source, :source_icon, :servings, :diet_labels, :health_labels, :ingredients_block, :ingredients, :calories, :total_nutrients, :total_daily, :digest

  def initialize(recipe_hash)

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

    if @name == nil || @name == "" || @url == nil || @url == "" || @uri == nil || @uri == ""
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

  end

end
