require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase

  test "search returns an array of 10 Recipes per page and a count" do
    VCR.use_cassette("recipes") do
      results = EdamamApiWrapper.search("matsutake", 1)
      assert_kind_of Array, results
      results[0].each do |result|
        assert_kind_of Recipe, result
      end

      assert_kind_of Fixnum, results[1]
      assert_equal 10, results[0].length
    end
  end

  test "recipe returns only 1 Recipe" do
    uri = "44c99dd99b004130623c68095b4b58b0"
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.recipe(uri)
      assert_kind_of Recipe, recipe
    end
  end

end
