require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  #
  # INSTANCE METHODS
  #

  test "Recipe can be created with a label and id" do
    label = "chicken"
    id = 5
    r = Recipe.new(label, id)
    assert_equal r.label, label
    assert_equal r.id, id
  end

  #
  # SELF METHODS
  #

  test "Recipe will be set to nil if reset" do
    label = "chicken"
    id = 5
    r = Recipe.new(label, id)
    assert_not_nil r
    r = Recipe.reset
    assert_nil r
  end

  test "search_label will return recipes with that diet label search term" do
    r = []
    r1 = Recipe.new("chicken", 4, dietlabels: ["Low-Fat"])
    r2 = Recipe.new("chicken", 5, dietlabels: ["Low-Fat"])
    r3 = Recipe.new("chicken", 6, dietlabels: ["High-Fiber"])
    r << r1
    r << r2
    r << r3
    Recipe.search_label(["Low-Fat"], r)
    assert_includes r, r1
    assert_includes r, r2
    assert_not_includes r, r3
  end
end
