require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with name and api_hash" do
    name = "test name"
    api_hash = {yield: 3}
    recipe = Recipe.new(name, api_hash)
    assert_equal name, recipe.name
    assert_equal api_hash[:yield], recipe.yield
  end

  test "Recipe.all should return an array of recipes" do
    search_term = "chicken"
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.recipe_search(search_term)
      assert_not recipes.empty?
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
