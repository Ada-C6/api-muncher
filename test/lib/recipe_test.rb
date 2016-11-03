require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with label and uri and " do
    uri = "test-uri"
    label = "test-label"
    source_name = "test-source_name"

    r = Recipe.new(label, source_name, uri)

    assert_equal r.uri, uri
    assert_equal r.label, label
    assert_equal r.source_name, source_name
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
