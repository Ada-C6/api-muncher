require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with api_hash" do
    api_hash = {name: "Test Recipe", yield: 3}
    recipe = Recipe.new(api_hash)
    assert_equal api_hash[:name], recipe.name
    assert_equal api_hash[:yield], recipe.yield
  end

  test "Recipe.all should return an array of recipes" do
    search_term = "chicken"
    page = 1
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
