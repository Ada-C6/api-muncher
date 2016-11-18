require 'test_helper'
require 'Recipe.rb'

class RecipeTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "All attributes must be set correctly" do
    tester = Recipe.new("chicken pot pie", "imagejpg", "uri-code", 3, "url", "ingredients", "dietary info", ["nutrients"], 1234)
    assert tester.name == "chicken pot pie"
    assert tester.image == "imagejpg"
    assert tester.uri == "uri-code"
    assert tester.serving == 3
    assert tester.url == "url"
    assert tester.ingredients == "ingredients"
    assert tester.dietinfo == "dietary info"
    assert tester.nutrients == ["nutrients"]
    assert tester.calories == 1234
  end

  test "Recipe must be intialized with at least a name, image, and uri" do
    tester = Recipe.new("Chicken", "image", "uri")
    assert tester.is_a? Recipe
  end

  test "Recipe that is not initialized with name, image, or uri raises Argument error" do
    assert_raises ArgumentError do
      Recipe.new("Chicken", "image")
    end
    assert_raises ArgumentError do
      Recipe.new("Chicken")
    end
  end

end
