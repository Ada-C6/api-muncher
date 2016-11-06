require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "EdamamApiWrapper.searchrecipes should return an array of Recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.search("bean")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "EdamamApiWrapper.searchrecipes should return an empty array if no match" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.search("savoflange")
      assert recipes.empty?
      assert_kind_of Array, recipes
    end
  end

  test "EdamamApiWrapper.find should return a Recipe object" do
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.find('recipe_637913ec61d9da69eb451818c3293df2')
      assert recipe
      assert_kind_of Recipe, recipe
      assert_equal recipe.label, "Dijon and Tarragon Grilled Chicken"
    end
  end
end
