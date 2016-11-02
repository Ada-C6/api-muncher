require 'test_helper'

class EdamamAPIWrapperTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Can receive information from Edamam API" do
    VCR.use_cassette("channels") do
      search_term = chicken
      name = "Grilled Deviled Chickens Under a Brick"
      api_hash =
      search_term = chicken
      recipes = EdamamApiWrapper.recipe_search(search_term)
      assert response["ok"]
      assert_equal hit["recipe"]["label"], name
    end
  end

  test "search_recipe will return an array of Recipes" do
    VCR.use_cassette("channels") do
      search_term = chicken
      recipes = EdamamApiWrapper.recipe_search(search_term)
      assert_not recipes.empty?
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
