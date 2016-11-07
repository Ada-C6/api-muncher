require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that list_search_results returns an array of SearchResult objects" do
    VCR.use_cassette("search_results") do
      search_results = EdamamApiWrapper.list_search_results("chicken")
      assert_kind_of Array, search_results
      assert_not search_results.empty?
      search_results.each do |result|
        assert_kind_of SearchResult, result
      end
    end
  end
end
