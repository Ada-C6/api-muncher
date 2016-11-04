require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "find_recipes will return an Array" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.find_recipes("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
