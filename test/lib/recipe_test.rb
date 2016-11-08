require 'test_helper'
require 'recipe'

class RecipeTest < ActionController::TestCase

  #just to verify  that Rake can pick up the test
  test "the truth" do
    assert true
  end

  test "must provide a name for Recipe" do
    assert_raises ArgumentError do
      Recipe.new nil, "url", "image", "id", "ingredients", "diet_labels", "health_labels"
    end
    assert_raises ArgumentError do
      Recipe.new "", "url", "image", "id", "ingredients", "diet_labels", "health_labels"
    end
  end

  test "must provide an idfor Recipe" do
    assert_raises ArgumentError do
      Recipe.new "name", "url", "image", nil, "ingredients", "diet_labels", "health_labels"
    end
    assert_raises ArgumentError do
      Recipe.new "name", "url", "image", "", "ingredients", "diet_labels", "health_labels"
    end
  end


end
