require 'test_helper'
require 'Edamam_Api_Wrapper'
require 'Recipe'

class EdamamApiWrapperTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Can Retrieve a list of recipes based on query" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.search("chicken")

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

  test "Retrieves nil when given the wrong id or key" do
    VCR.use_cassette("bad-id-key") do
      ID = ENV["APP_ID"]
      KEY = ENV["APP_KEY"]
      recipes1 = EdamamApiWrapper.search("chicken", "wrong-id", KEY)
      recipes2 = EdamamApiWrapper.search("chicken", ID, "wrong-key")

      assert recipes1 == nil
      assert recipes2 == nil
    end
  end

  test "Can find a specific recipe given a uri" do
    VCR.use_cassette("find-one-recipe") do
      recipe = EdamamApiWrapper.find_recipe(URI.encode('http://www.edamam.com/ontologies/edamam.owl#recipe_49e782726a1972e180a3f8067f86c4c3'))

      assert recipe.name == "Chickpea, Mint, Orange & Feta Salad"
      assert recipe.ingredients.is_a? Array
      assert recipe.ingredients.include? "1 orange , juiced"
      assert recipe.dietinfo.is_a? Array
    end
  end

  test "Retrieves nil when given a non-existent recipe uri" do
    VCR.use_cassette("no-recipe-uri") do
      recipe = EdamamApiWrapper.find_recipe(URI.encode('http://www.edamam.com/wronguri'))

      assert recipe == nil
    end
  end


end
