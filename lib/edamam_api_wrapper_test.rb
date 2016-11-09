require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "that the tests are running" do
    assert true
  end

  test "search_recipe returns an array of recipes matching that term" do
    VCR.use_cassette("recipes") do
      veg_recipes = EdamamApiWrapper.search_recipe("seitan", 2)
      assert_kind_of Array, veg_recipes
      assert_kind_of Recipe, veg_recipes[0]
    end
  end

  test "by_id returns an array with info about one recipe" do
    VCR.use_cassette("recipe") do
      plain_kale = EdamamApiWrapper.by_id("d6687789d38704e912beb94def4b2106")
      assert_equal 1, plain_kale.count
      assert_kind_of Array, plain_kale
      assert_kind_of Recipe, plain_kale[0]
    end
  end
end
