require 'test_helper'
require 'recipe'

class RecipeTest < ActionController::TestCase

  #just to verify  that Rake can pick up the test
  test "the truth" do
    assert true
  end

  test "must provide a query for Recipe" do
    assert_raises ArgumentError do
      Recipe.new nil
    end
  end
end
