require 'test_helper'
require 'awesome_print'
require 'faker'

class RecipeTest < ActionController::TestCase
  # Just to verify that Rake can pick up the test
  test 'the truth' do
    assert true
  end

  test "you must provide a name and ID for a recipe" do
    assert_raises ArgumentError do
      Recipe.new(nil, nil)
    end
    assert_raises ArgumentError do
      Recipe.new("", "")
    end
    assert_raises ArgumentError do
      Recipe.new("name", nil)
    end
    assert_raises ArgumentError do
      Recipe.new("name", "")
    end
    assert_raises ArgumentError do
      Recipe.new(nil, "id")
    end
    assert_raises ArgumentError do
      Recipe.new("", "id")
    end
  end

  test "Name attribute is set correctly" do
    test_me = Recipe.new("name", "id")
    assert test_me.name == "name"
  end

  test "ID attribute is set correctly" do
    test_me = Recipe.new("name", "id")
    assert test_me.id == "id"
  end

end
