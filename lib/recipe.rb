class Recipe


  attr_reader :name, :id, :health_labels, :ingredients, :uri, :servings, :nutrients

  def initialize(recipe_hash)
    @name = recipe_hash[:name]
    @id = recipe_hash[:id]
    @health_labels = recipe_hash[:health_labels]
    @ingredients = recipe_hash[:ingredients]
    @uri = recipe_hash[:uri]
    @servings = recipe_hash[:servings].to_f
    @nutrients = recipe_hash[:nutrients]
  end

  def self.make_recipe_objs_from_api(recipe_array)
    recipes=[]

    recipe_array.each_with_index do |recipe_hash, index|
      recipes<<Recipe.new({
        name: recipe_hash['recipe']['label'],
        id: (index+1).to_s,
        health_lables: recipe_hash['recipe']['healthLabels'],
        ingredients: Ingredient.make_ingredients_from_api(recipe_hash['recipe']['ingredients']),
        uri: recipe_hash['recipe']['uri'],
        servings: recipe_hash['recipe']['yield'],
        nutrients: Nutrient.make_nutrients_from_api(recipe_hash['recipe']['totalNutrients'])

         })
    end
    return recipes
  end
end

