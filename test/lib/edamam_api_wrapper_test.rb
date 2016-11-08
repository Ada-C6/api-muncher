require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that listrecipes returns an array of Recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("butter")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "that listrecipes returns an empty array if there are no hits" do
    VCR.use_cassette("recipe") do
      these_recipes = EdamamApiWrapper.listrecipes("xxxxyyyy")
      assert_kind_of Array, these_recipes
      assert_equal these_recipes.length, 0
    end
  end


end
