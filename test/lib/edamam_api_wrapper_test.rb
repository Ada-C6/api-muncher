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
end
