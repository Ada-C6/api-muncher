require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "search gets back a collection of Recipes" do
    VCR.use_cassette("recipes") do
      term = "chicken"
      recipes =  EdamamApiWrapper.search(term)

      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "search should return nil if search doesn't match anything" do
    VCR.use_cassette("recipes") do
      term = "ththththt"
      recipes = EdamamApiWrapper.search(term)

      assert_nil recipes
    end
  end

  test "find gets back a single recipe" do
    VCR.use_cassette("recipes") do
      id = "4b4dc08187822cb49fb12c1e6ded859f"
      recipe =  EdamamApiWrapper.find_recipe(id)

      assert_kind_of Recipe, recipe
    end
  end

  test "find returns an error if you call it without a parameter" do
    VCR.use_cassette("recipes") do
      assert_raises ArgumentError do
        EdamamApiWrapper.find_recipe
      end
    end
  end

  test "find returns nil if you pass it something other than a string identifier" do
    VCR.use_cassette("recipes") do
      not_recipes = [9, "chicken", "9", 2.1, "http://www.edamam.com/ontologies/edamam.owl%23recipe_3b419d0a11e7fadad1680b9e0f8bb63b"]

      not_recipes.each do |item|
        assert_equal nil, EdamamApiWrapper.find_recipe(item)
      end
    end
  end
end
