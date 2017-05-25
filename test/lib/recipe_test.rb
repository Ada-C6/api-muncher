require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with only label and uri" do
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

  test "Recipe.search will not work if not given a keyword (aka a parameter)" do
    VCR.use_cassette("recipes") do
      assert_raise ArgumentError do
        Recipe.search
      end
    end
  end

  test "Recipe.by_uri should return an array of recipies" do
    uri = "3f10dadc9f8dbe253c076927204cea50"

    VCR.use_cassette("recipes") do
      recipe = Recipe.by_uri(uri)

      assert_kind_of Recipe, recipe
      assert_not recipe.nil?
    end
  end

  test "Recipe.by_uri will not work if not given a parameter" do
    VCR.use_cassette("recipes") do
      assert_raise ArgumentError do
        Recipe.by_uri
      end
    end
  end
end
