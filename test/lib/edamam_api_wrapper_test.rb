require 'test_helper'
class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Will get a list of Recipes with a valid search term" do
    #record in a cassete called recipes
    VCR.use_cassette("recipes") do
      search = "pizza"
      from = 0
      to = 10
      recipes = EdamamApiWrapper.listrecipes(search, from, to )
      assert_kind_of Array, recipes
      assert_kind_of Integer, recipes[1]
      assert_not recipes.empty?

      recipes[0].each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test ".listrecipes should return an empty array if no recipes are found" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("sadklfjalsjf", 0, 10)
      assert_kind_of Array, recipes
      assert recipes[0].empty?
      assert recipes[1] == 0
    end
  end

  test ".get_recipe should return a recipe given a valid id" do
    VCR.use_cassette("recipes") do
      id = "576b197cd6b49772586df31b16abb592"
      recipe = EdamamApiWrapper.get_recipe(id)
      assert_not recipe.empty?
    end
  end
  test ".get_recipe should not return a recipe given a valid id" do
    VCR.use_cassette("recipes") do
      id = "576b197cd6b49772586df31b16abb"
      recipe = EdamamApiWrapper.get_recipe(id)
      assert recipe.empty?
    end
  end
end
