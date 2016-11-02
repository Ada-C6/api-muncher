require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that Recipe objects are created with all relevant information in the recipe hash" do
    recipe_hash = {
    name: "pannito",
    photo: "www.photo.com/pannito"
    }
    pannito = Recipe.new(recipe_hash)
    assert_equal pannito.name, recipe_hash[:name]
  end

end
