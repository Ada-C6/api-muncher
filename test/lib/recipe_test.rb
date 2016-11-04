require 'test_helper'
require 'recipe'

class RecipeTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "You must provide a valid recipe with uri, photo, name and ingredientLines" do
    assert_raises ArgumentError do
      Recipe.new nil, nil
    end

    assert_raises ArgumentError do
      Recipe.new "", ""
    end

    assert_raises ArgumentError do
      Recipe.new "", "1"
    end


  end


end
