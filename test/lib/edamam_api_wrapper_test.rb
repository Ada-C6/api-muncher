require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "listrecipes returns an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("rhubarb", 1)
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "recipe_from_uri returns an array of one recipe" do
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.recipe_from_uri("http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
      assert_kind_of Array, recipe
      assert_equal 1, recipe.count
      assert_kind_of Recipe, recipe.first
    end
  end
end
