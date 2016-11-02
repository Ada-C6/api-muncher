require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase

  test "search returns an array of Recipes" do
    VCR.use_cassette("recipes") do
      results = EdamamApiWrapper.search("ham")
      assert_kind_of Array, results
      results.each do |result|
        assert_kind_of Recipe, result
      end
    end
  end
end
