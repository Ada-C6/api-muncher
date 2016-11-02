require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "Recipe can be created with valid information" do
    recipe_hash = {name: "food", photo: "photo_url", original_link: "urlurl", ingredients: ["food", "food", "food"], diet_labels: ["label", "label"]}
    r = Recipe.new(recipe_hash)
    assert_equal r.name, recipe_hash[:name]
    assert_equal r.photo, recipe_hash[:photo]
  end

  test "Recipe.search should return an array of Recipe objects" do
    VCR.use_cassette("recipes") do
      chicken_search = Recipe.search("chicken")
      assert_kind_of Array, chicken_search
      assert_not chicken_search.empty?
      chicken_search.each do |item|
        assert_kind_of Recipe, item
      end
    end
  end
  
end
