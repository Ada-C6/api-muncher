require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the teset are running" do
    assert true
  end

  test "recipe can be created with label, photo, and uri" do
    label = "test label"
    photo = "test photo"
    uri = "test uri"

    r = Recipe.new(label, photo, uri)
    assert_equal r.label, label
    assert_equal r.photo, photo
    assert_equal r.uri, uri
  end

  test "self.all returns a list of recipes" do
    VCR.use_cassette("recipes") do
      keyword = "butter"
      page = 1
      recipe = Recipe.all(keyword, page)

      assert_kind_of Array, recipe
      assert_kind_of Recipe, recipe.first
    end
  end
  
end
