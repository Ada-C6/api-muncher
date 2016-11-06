require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase

  test "can create a new instance of recipe" do
    VCR.use_cassette("new_recipes") do
      recipe_hash = {
        name: "new recipe",
        photo: "flakjhdsf",
        original_link: "asdfjh",
        ingredients: ["pickles", "bacon"],
        diet_labels: ["delicious"],
        uri: "aksdjhfg"
      }
      new_recipe = Recipe.new(recipe_hash)
      assert_kind_of Recipe, new_recipe
      assert_not_nil new_recipe
      assert_equal recipe_hash[:name], new_recipe.name
    end


  end
end
