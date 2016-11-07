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


  test "4. should receive an ArgumentError message for a search with no input" do
    VCR.use_cassette("search") do

      assert_raises ArgumentError do
        EdamamApiWrapper.search()
      end
    end # VCR
  end # test

  # NOTE: I'm not testing or handling non-string-input cases because the API interprets any search terms as strings

end # class
