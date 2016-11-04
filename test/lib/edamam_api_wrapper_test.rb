require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "list_recipes returns an array of recipes that match the search term" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("beef")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
      # assert recipes.length =< 100
    end
  end
end
