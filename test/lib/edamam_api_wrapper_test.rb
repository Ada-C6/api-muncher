require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test ".search returns an array of channel objects" do
    VCR.use_cassette("recipes") do
      chicken_search = EdamamApiWrapper.search("chicken")
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
      find_recipe = EdamamApiWrapper.find(id)

      assert_kind_of Recipe, find_recipe
      assert_not_nil find_recipe
      assert_equal "Dijon and Tarragon Grilled Chicken", find_recipe.name
      assert_equal id, find_recipe.uri
    end
  end

  test ".find returns nil if there is no recipe with that id" do
    VCR.use_cassette("recipes") do
      id = "invalid_url"
      find_recipe = EdamamApiWrapper.find(id)

      assert_nil find_recipe
    end
  end
end
