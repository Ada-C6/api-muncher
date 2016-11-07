require 'test_helper'

class EdamamWrapperTest < ActiveSupport::TestCase
  test "self.all_results returns an array with recipes and page data" do

    VCR.use_cassette("recipes") do
      results = EdamamWrapper.all_results("chocolate cheesecake graham cracker", 1)
      assert_kind_of Array, results
      assert_not results.empty?

      recipe_data = results.first
      page_data = results.last

      # Check the first 10; I know that that means
      # I'm running the risk that the 11th result isn't
      # what I want, but I don't think I would want to
      # run an assert on 100+ results. I'm making a
      # tradeoff on errors vs. speed.
      10.times do |i|
        assert_kind_of Recipe, recipe_data[i]
      end

      assert_kind_of Fixnum, page_data
    end
  end

  test "self.find(uri) returns a single Recipe object" do
    VCR.use_cassette("recipes") do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_5aa8ce3aed2294da655465a983860794"
      result = EdamamWrapper.find(uri)
      assert_equal result.uri, uri
      assert_kind_of Recipe, result
      assert_equal "http://www.seriouseats.com/recipes/2013/08/mint-chocolate-chunk-cheesecake-bars.html", result.url
    end
  end
end
