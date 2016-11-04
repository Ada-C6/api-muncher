require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  # self.search_recipes(string,page)
  test "returns 10 recipes given a string and page" do
    VCR.use_cassette("recipes") do
    recipe_list = EdamamApiWrapper.search_recipes("chicken", 1)
    assert_kind_of Array, recipe_list
    assert_equal recipe_list.length.to_i, 10
    end
  end

  test "returns an empty array if there are no matching recipes" do
    VCR.use_cassette("recipes") do
    recipe_list = EdamamApiWrapper.search_recipes("aaaaaaaaaaa", 1)
    assert_kind_of Array, recipe_list
    assert_equal recipe_list.length, 0
    end
  end

  # Things handeled in the controller/recipe.rb that don't need to be accounted for here as well.
  # pages out of range - in controller
  # a recipe uri - controller

  # self.count(string)
  test "self.count returns the number of occurances of given string" do
    VCR.use_cassette("recipes") do
      BASE_URL = "https://api.edamam.com/search"
      ID = ENV["EDAMAM_ID"]
      KEYS = ENV["EDAMAM_KEYS"]
      total_recipes = EdamamApiWrapper.count("durian")
      assert_equal total_recipes, 9
    end
  end

  test "self.count returns 0 if there are no occurances" do
    VCR.use_cassette("recipes") do
      BASE_URL = "https://api.edamam.com/search"
      ID = ENV["EDAMAM_ID"]
      KEYS = ENV["EDAMAM_KEYS"]
      total_recipes = EdamamApiWrapper.count("aaaaaaaaaaaa")
      assert_equal total_recipes, 0
    end
  end

  # self.one_recipe(string)
  test "should only ever return an array of one recipe" do
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.one_recipe("c42a650a96e7b1317b924d8b6c50553d")
      assert_kind_of Array, recipe
      assert_equal recipe.length, 1
    end
  end

  # AND the controller will test to make sure that the string/uri is valid. if not, it is directed to another method. So the only "string" that uses this method id with a the id of the uri.
end
