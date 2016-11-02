require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "initialize will create a Recipe object" do
    name = "name"
    test_id = "test_id"
    recipe = Recipe.new(name,test_id)

    assert_equal name, recipe.name
    assert_equal test_id, recipe.id
    assert_kind_of Recipe, recipe
  end

  test "Recipe.all returns an array of Recipe objects" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all

      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.by_name should return nil if no match" do
    VCR.use_cassette("recipes") do
      recipe = Recipe.by_name("non-existant_recipe")
      assert_nil recipe
    end
  end

  test "Recipe.by_name should return matching recipe" do
    VCR.use_cassette("recipes") do
      recipe = Recipe.by_name("test-api-brackets")
      name = "test-api-brackets"
      assert_kind_of Recipe, recipe
      assert_equal name, recipe.name
    end
  end
end
