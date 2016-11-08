require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "if search returns array of Recipe objects" do
    VCR.use_cassette("recipe") do
      recipes = Recipe.search("butter")
      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "returns 0 Recipe objects if there are no matches for the search term " do
    VCR.use_cassette("recipe") do
      recipes = Recipe.search("xxxxxyyyyy")
      assert_equal recipes.length, 0
    end
  end

  test "return the right number of recipes for search terms" do
    VCR.use_cassette("recipe") do
      recipe_search = Recipe.search("chicken sausage, gravy, kale")
      assert_equal recipe_search.count, 1
    end
  end

  test "return an individual recipe when a valid id is in the url" do
    VCR.use_cassette("recipe") do
      recipe = Recipe.by_id("c468dc28f8b64bb711125cc150b15c25")
      assert_not recipe.nil?
    end

    test "return nil if an invalid id is in the url" do
      VCR.use_cassette("recipe") do
        recipe = Recipe.by_id("xxxxx")
        assert recipe.nil?
      end
    end
  end



end
