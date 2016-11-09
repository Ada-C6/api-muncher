require 'test_helper'
require 'muncher_api_wrapper'
require 'recipe'

class Muncher_Api_Test < ActionController::TestCase

  test "Can retrieve a list of recipes" do
    VCR.use_cassette("get-recipe-list") do
      recipes = MuncherApiWrapper.get_recipes("durian")

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

  test "Can retrieve a single recipe" do
    VCR.use_cassette("get-recipe-show") do
      recipe = MuncherApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_c9044642b3673039d454227917c51e11")

      assert recipe.is_a? Array
      assert recipe.length == 1
      recipe.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

  test "Returns an empty array when a query returns zero search results" do
    VCR.use_cassette("check-zero-results") do
      recipes = MuncherApiWrapper.get_recipes("353")
      assert_equal recipes, nil
      refute recipes.is_a? Array
    end
  end

end
