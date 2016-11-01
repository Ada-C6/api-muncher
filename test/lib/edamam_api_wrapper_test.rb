require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "listrecipes should return an array of Recipes" do
    VCR.use_cassette("recipies") do
      recipes = EdamamApiWrapper.listrecipes("chicken")

      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do | recipe |
        assert_kind_of Recipe, recipe
      end
    end
  end
end
