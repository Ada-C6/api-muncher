require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end
  test "Recipe can be initialized with a name an uri" do
    name = "test name"
    uri = "test uri"
    recipe = Recipe.new(name, uri)
    assert_equal recipe.name, name
    assert_equal recipe.uri, uri
  end
  test "recipe_look_up ought to return a single recipe object" do
    VCR.use_cassette("recipes") do
      uri = "c17944a7af0decc2f627246b0bb24d8a"
      summer = Recipe.recipe_look_up(uri)
      assert_kind_of Recipe, summer
      assert_not summer.nil?
    end
  end

end
