require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with label and uri" do
    uri = "test-uri"
    r = Recipe.new(uri)

    assert_equal r.uri, uri
  end

  test "Recipe.search should return an array of recipies" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do | recipe |
        assert_kind_of Recipe, recipe
      end
    end
  end
end
