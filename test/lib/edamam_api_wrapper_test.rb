require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "1. should be able to create an instance of EdamamApiWrapper" do
    assert EdamamApiWrapper.new
  end

  test "2. should be able to send search with one word" do
    VCR.use_cassette("search") do
      term = "gummy"
      response = EdamamApiWrapper.search(term)

      assert_not_nil response

      response_share_urls = response["hits"].map { |hit| hit["recipe"]["shareAs"] } # the "shareAs" url includes original search term, pre-normalization (in this case: "gummies")

      response_share_urls.each do |url|
        assert_match /gummy/, url
      end # each
    end # VCR
  end # test

  test "3. should be able to send search with two words" do
    VCR.use_cassette("search") do
      term = "gummy worms"
      response = EdamamApiWrapper.search(term)

      assert_not_nil response

      response_share_urls = response["hits"].map { |hit| hit["recipe"]["shareAs"] } # the "shareAs" url includes original search term, pre-normalization if any

      response_share_urls.each do |url|
        assert_match /gummy/, url
        assert_match /worms/, url
      end # each
    end # VCR
  end # test

  # NOTE: I'm not testing or handling non-string-input cases because search form will allow only string input
  test "4. should receive an ArgumentError message for a search with no input" do
    VCR.use_cassette("search") do

      assert_raises ArgumentError do
        EdamamApiWrapper.search()
      end
    end # VCR
  end # test

  # # @todo - remove this test; search_results method has been moved to the Recipe class
  # test "5. search_results should return only recipe hits" do
  #   VCR.use_cassette("search") do
  #     term = "jello"
  #     results = EdamamApiWrapper.search_results(term)
  #
  #     results.each do |result|
  #       assert_instance_of Recipe, result
  #     end # each
  #   end # VCR
  # end

end # class
