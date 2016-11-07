require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "can be created with a name and uri" do
    name = "chicken pot pie"
    uri = "http://www.something.com/something"
    recipe = Recipe.new(name, uri)
    assert_equal recipe.name, name
    assert_equal recipe.uri, uri
  end

  test "cannot be created without a name" do
    assert_raises ArgumentError, "nil name" do
      Recipe.new(nil, "uri")
    end
  end

  test "cannot be created with a blank name" do
    assert_raises ArgumentError, "empty name" do
      Recipe.new("", "uri")
    end
  end

  test "cannot be created without a URI" do
    assert_raises ArgumentError, "nil uri" do
      Recipe.new("name", nil)
    end
  end

  test "cannot be created with a blank URI" do
    assert_raises ArgumentError, "empty uri" do
      Recipe.new("name", "")
    end
  end

  test "Recipe can respond to all options" do
    name = "chicken pot pie"
    uri = "something something"
    recipe = Recipe.new(name, uri)
    options = [:image, :source, :url, :servings, :diet_labels, :calories, :ingredient_lines, :nutrients]
    options.each do |option|
      assert_respond_to recipe, option
    end
  end

  test "Recipe stores all options" do
    name = "mac & cheese"
    uri = "something"
    options = {
      source: "Mom's recipe box",
      url: "http://www.home.com/",
      servings: 6
    }
    recipe = Recipe.new(name, uri, options)
    assert_equal name, recipe.name
    assert_equal uri, recipe.uri
    assert_equal options[:source], recipe.source
    assert_equal options[:url], recipe.url
    assert_equal options[:servings], recipe.servings
  end
end
