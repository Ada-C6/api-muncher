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

  test ".find returns correct Recipe object" do
    VCR.use_cassette("recipes") do
      id = "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2"
      find_recipe = Recipe.find(id)

      assert_kind_of Recipe, find_recipe
      assert_not_nil find_recipe
      assert_equal "Dijon and Tarragon Grilled Chicken", find_recipe.name
      assert_equal id, find_recipe.uri
    end
  end

  test ".find returns nil if there is no recipe with that id" do
    VCR.use_cassette("recipes") do
      id = "invalid_url"
      find_recipe = Recipe.find(id)

      assert_nil find_recipe
    end
  end
end
