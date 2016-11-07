require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "should be able to create a new Recipe object"  do
    VCR.use_cassette("recipe") do
    recipe_hash = {
      label: "recipe_hash[:label]",
      image: "recipe_hash[:image]",
      uri: "recipe_hash[:uri]",
      ingredient_lines: "recipe_hash[:ingredientLines]",
      total_nutrients: "recipe_hash[:totalNutrients]",
      original_recipe: "ecipe_hash[:url]",
      calories: 2323,
      healthLabels: "recipe_hash[:healthLabels]",
      source: "recipe_hash[:source]"
    }
    recipe = Recipe.new(recipe_hash)
    assert_kind_of Recipe, recipe
    assert_equal recipe_hash[:label], recipe.label
  end
end

test "Will get a list of Recipes with a valid search term" do
  #record in a cassete called recipes
  VCR.use_cassette("recipes") do
    search = "pizza"
    from = 0
    to = 10
    recipes = Recipe.search(search, from, to )
    assert_kind_of Array, recipes
    assert_kind_of Integer, recipes[1]
    assert_not recipes.empty?

    recipes[0].each do |recipe|
      assert_kind_of Recipe, recipe
    end
  end
end

test ".listrecipes should return an empty array if no recipes are found" do
   VCR.use_cassette("recipes") do
     recipes = Recipe.search("sadklfjalsjf", 0, 10)
     assert_kind_of Array, recipes
     assert recipes[0].empty?
     assert recipes[1] == 0
   end
 end

 test ".get_recipe should return a recipe given a valid id" do
    VCR.use_cassette("recipes") do
      id = "576b197cd6b49772586df31b16abb592"
      recipe = Recipe.get_recipe_id(id)
      assert_not recipe.empty?    
    end
  end
  test ".get_recipe should not return a recipe given a valid id" do
     VCR.use_cassette("recipes") do
       id = "576b197cd6b49772586df31b16abb"
       recipe = Recipe.get_recipe_id(id)
       assert recipe.empty?
     end
   end
end
