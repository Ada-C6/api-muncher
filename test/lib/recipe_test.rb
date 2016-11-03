require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  # INSTANCE METHODS
  test "Recipe can be created with label and uri" do
    label = "just a string"
    uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_10e962aff67fafd7b8506ee963cfbe08"
    recipe = Recipe.new(label, uri)
    assert_equal recipe.label, label
  end

  # SELF METHODS with inherited class instance variables
  test "Recipe.search should set @results to an array of up to 10 Recipes and @count" do
    VCR.use_cassette("recipes") do
      Recipe.search("matsutake", 1)
      recipes = Recipe.results
      count = Recipe.count
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
      assert_kind_of Fixnum, count
    end
  end

  test "Recipe.find should find the memoized recipe using the uri if it exists in @results" do
    VCR.use_cassette("recipes") do
      Recipe.search("matsutake", 1)
      recipe = Recipe.results.first
      assert_equal Recipe.find(recipe.uri), recipe
    end
  end

  test "Recipe.find should make a new API query if it does not exist in @results" do
    VCR.use_cassette("recipes") do
      uri = "93ad9c1dc8c1397ab8b46774fec85e8a"
      recipe = Recipe.find(uri)
      assert_kind_of Recipe, recipe
    end
  end
end
