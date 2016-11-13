require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end


  test "list recipes returns array of Recipe objects" do
    VCR.use_cassette("recipe") do
      recipes = Recipe.search("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "returns an empty array if there aren't any matches" do
    VCR.use_cassette("recipe") do
      index = Recipe.search("xxxxxx")
      assert_kind_of Array, index
      assert_equal index.length, 0
    end
  end


  test "Returns the correct number of recipes based on search term" do
    VCR.use_cassette("recipe") do
      recipes = Recipe.search("andouille sausage, shrimp and chicken paella recipe")
      assert_equal recipes.count, 6
    end
  end

  test "Returns 0 if there are no matching recipes for search term" do
   VCR.use_cassette("recipes") do
     recipes = Recipe.search("xxxxxx")
     assert_equal recipes.count, 0
   end
 end

end
