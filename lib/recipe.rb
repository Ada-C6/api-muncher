class Recipe
  attr_reader :label, :image, :uri, :ingredientLines, :totalNutrients, :url, :calories, :healthLabels, :count, :source

  # def initialize(label, options = {} )
  def initialize( recipe_hash)
    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @uri = recipe_hash[:uri]
    @ingredient_lines = recipe_hash[:ingredientLines]
    @total_nutrients = recipe_hash[:totalNutrients]
    @original_recipe = recipe_hash[:url]
    @calories = recipe_hash[:calories]
    @healthLabels = recipe_hash[:healthLabels]
    @source = recipe_hash[:source]
  end

  #why are repeating the same method.
  def self.search(search, from, to)
    @data =  EdamamApiWrapper.listrecipes(search, from, to)

    return @data
  end

  def self.get_recipe_id(id)
    data = EdamamApiWrapper.get_recipe(id)
  end
end
