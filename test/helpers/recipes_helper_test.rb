require 'test_helper'
include RecipesHelper

class RecipesHelperTest < ActiveSupport::TestCase
  test "total pages returns an integer" do
    VCR.use_cassette("recipes") do
      pages_total = total_pages(25)
      assert_kind_of Integer, pages_total
      assert_equal 3, pages_total
    end
  end

  test "if no results are returned total pages is 0" do #this only affects whether links to next 10/previous 10 show up at the bottom of the page
    VCR.use_cassette("recipes") do
      pages_total = total_pages(0)
      assert_kind_of Integer, pages_total
      assert_equal 0, pages_total
    end
  end
end
