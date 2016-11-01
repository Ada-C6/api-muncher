require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the teset are running" do
    assert true
  end

  test "recipe can be created with name, photo, and link" do
    name = "test name"
    photo = "test photo"
    link = "test link"

    r = Recipe.new(name, photo, link)
    assert_equal r.name, name
    assert_equal r.photo, photo
    assert_equal r.link, link
  end
end
