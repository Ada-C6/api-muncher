require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(
      "Test",
      calories: {"quantity" => 100.0},
      daily:{"nutrient_label" => {"label" => "nutrient_name", "quantity" => 300.00 }},
      servings: 8,
      diet_labels: ["one diet", "two diet", "red diet", "blue diet"],
      health_labels: ["death", "stasis", "regenerate", "heal"]
      )
  end

  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with a label" do
    label = "Best Test Ever!"
    recipe = Recipe.new(label)
    assert_kind_of Recipe, recipe
    assert_equal recipe.label, label
  end

  test "Recipe.search should return an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.search should return an empty array if no match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("savoflange")
      assert recipes.empty?
      assert_kind_of Array, recipes
    end
  end

  test "Recipe.find should return a Recipe object" do
    VCR.use_cassette("recipes") do
      recipe = Recipe.find('recipe_637913ec61d9da69eb451818c3293df2')
      assert recipe
      assert_kind_of Recipe, recipe
      assert_equal recipe.label, "Dijon and Tarragon Grilled Chicken"
    end
  end

  test "kcal_per_serving should return a Float of the correct value" do
    cals = @recipe.kcal_per_serving
    assert_equal cals, 12.5
    assert_kind_of Float, cals
  end

  test "get_daily should find the daily value of the nutrient label passed" do
    daily_nutrient = @recipe.get_daily("nutrient_name")
    assert_equal 37.5, daily_nutrient
    assert_kind_of Float, daily_nutrient
  end

  test "diet_info should combine health_labels and diet_labels" do
    diet_list = @recipe.diet_info
    assert_kind_of Array, diet_list
    assert_equal diet_list, ["death", "stasis", "regenerate", "heal", "one diet", "two diet", "red diet", "blue diet"]
  end

end
