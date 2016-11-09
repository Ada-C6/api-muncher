require 'test_helper'
require 'recipe'

class Recipe_Test < ActionController::TestCase

  test "Does this class even do what it is supposed to?" do
    recipe = Recipe.new("banana","image.jpg","http://www.seriouseats.com/recipes/2011/07/durian-smoothie-recipe.html","","","1 banana","http://www.edamam.com/ontologies/edamam.owl%23recipe_d1823f1d793b6f3d9421e8df6c020f1c")
    assert recipe.is_a? Recipe
    assert_equal recipe.label, "banana"
    assert_equal recipe.url, "http://www.seriouseats.com/recipes/2011/07/durian-smoothie-recipe.html"
    assert_equal recipe.healthLabels, ""
  end

end
