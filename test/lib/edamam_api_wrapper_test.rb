require  'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that the search bar retrieves information" do
    VCR.use_cassette("results") do
      search_term = "eggs"
      results = EdamamApiWrapper.search(search_term)
      assert_kind_of Array, results
      assert_not results.empty?
      results.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end


end
