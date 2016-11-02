require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "list recipes returns array of Recipe objects" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
