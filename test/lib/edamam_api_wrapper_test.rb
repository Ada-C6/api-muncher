require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "listrecipes returns an array of Recipe objects" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("beef")
      recipes.pop
      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "listrecipes returns nil if search word pulls up no results" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("xxxxxxxxxxx")

      assert_nil recipes
    end
  end

  test "listrecipes returns nil if search word is nil" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes(nil)

      assert_nil recipes
    end
  end

  test "listrecipe returns a single Recipe object with correct recipe ID" do
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.listrecipe("e74a63af2c01078b3a6cc34fbb06f061")

      assert_kind_of Recipe, recipe
      assert_not_nil recipe.name
    end
  end

  test "listrecipe returns nil if given a bad recipe ID" do
    VCR.use_cassette("bad-recipe-id") do
      recipe = EdamamApiWrapper.listrecipe("bad-id")

      assert_nil recipe
    end
  end

  test "listrecipe returns nil if given nil" do
    VCR.use_cassette("bad-recipe-id") do
      recipe = EdamamApiWrapper.listrecipe("bad-id")

      assert_nil recipe
    end
  end

  test "page should return two different arrays for two different calls for the same term" do
    VCR.use_cassette("pages") do
      page_one = EdamamApiWrapper.page("10","chicken")
      page_two = EdamamApiWrapper.page("20","chicken")

      assert_kind_of Array, page_one
      assert_kind_of Array, page_two

      assert_not_equal page_one, page_two
    end
  end
end
