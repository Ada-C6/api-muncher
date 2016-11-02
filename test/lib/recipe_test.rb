require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  #
  # INSTANCE METHODS
  #

  test "Recipe can be created with a label" do
    label = "chicken"
    r = Recipe.new(label)
    assert_equal r.label, label
  end

  #
  # SELF METHODS
  #

  test "Recipe will be set to nil if reset" do
    label = "chicken"
    r = Recipe.new(label)
    assert_not_nil r
    r = Recipe.reset
    assert_nil r
  end

end
