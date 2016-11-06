require 'test_helper'
require "results"


class RecipeResultsTest < ActionController::TestCase
  # Just to verify that Rake can pick up the test
  test "the truth" do
    assert true
  end

  test "You must provide a recipe name & uri to search for Recipe_Results" do
    assert_raises ArgumentError do
      Recipe_Results.new(nil, nil, nil, nil, nil, nil, nil)
    end
    assert_raises ArgumentError do
      Recipe_Results.new("", "", "", "", "", "", "")
    end
    assert_raises ArgumentError do
      Recipe_Results.new("", "12345", "", "", "", "", "")
    end
    assert_raises ArgumentError do
      Recipe_Results.new("this-name", "", "", "", "", "", "")
    end
    assert_raises ArgumentError do
      Recipe_Results.new("this-name", nil, "", "", "", "", "")
    end
    assert_raises ArgumentError do
      Recipe_Results.new(nil, "12345", "", "", "", "", "")
    end
  end

  test "Recipe Name is correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","","","","")
    assert test_me.recipe_name == "recipename"
  end

  test "Recipe Uri is correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","","","","")
    assert test_me.recipe_uri == "recipe_uri"
  end

  test "Recipe image is correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "a-picture","","","","")
    assert test_me.image == "a-picture"
  end
  test "Recipe ingredients are correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","these are ingredients","","","")
    assert test_me.ingredients == "these are ingredients"
  end
  test "Recipe url is correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","these are ingredients","www.thisisaurl.com","","")
    assert test_me.url == "www.thisisaurl.com"
  end

  test "Recipe diet labels are correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","these are ingredients","www.thisisaurl.com","low-fat","contains peanuts")
    assert test_me.diet_labels == "low-fat"
  end
  test "Recipe health labels are correctly set" do
    test_me = Recipe_Results.new("recipename","recipe_uri", "","these are ingredients","www.thisisaurl.com","low-fat","contains peanuts")
    assert test_me.health_labels == "contains peanuts"
  end
end
