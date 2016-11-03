require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true

  end

  test 'list_recipes returns an array of Recipes' do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("chicken")
      assert_kind_of Array, recipes

      recipes.each do |recipe|
      assert_kind_of Recipe, recipe
      end

    end
  end
end
