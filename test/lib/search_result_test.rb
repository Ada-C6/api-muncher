require 'test_helper'

class SearchResultTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  # test "SearchResult can be created with a label, image, url, diet labels, health labels and ingredients" do
  #   label = "Pad Thai"
  #   image = ""
  #   url = ""
  #   diet_labels = ["", ""]
  #   health_labels = ["", ""]
  #   ingredients = [""]
  #
  #   sr = SearchResult.new(label, image, url, diet_labels, health_labels, ingredients)
  #   assert_equal sr.label, label
  #   assert_equal sr.image, image
  #   assert_equal sr.url, url
  #   assert_equal sr.diet_labels, diet_labels
  #   assert_equal sr.health_labels, health_labels
  #   assert_equal sr.ingredients, ingredients
  # end

  test "SearchResult.all returns an array of SearchResult objects" do
    VCR.use_cassette("search_results") do
      results = SearchResult.all("asparagus")
      assert_kind_of Array, results
      assert_not results.empty?
      results.each do |result|
        assert_kind_of SearchResult, result
      end
    end
  end

end
