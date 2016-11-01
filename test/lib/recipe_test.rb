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


end
