require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with a label" do
    label = "Best Test Ever!"
    recipe = Recipe.new(label)
    assert_kind_of Recipe, recipe
    # assert_equal, recipe.name, name
  end
end
