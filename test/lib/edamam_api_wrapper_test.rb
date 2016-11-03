require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "should be able to create an instance of EdamamApiWrapper" do
    assert EdamamApiWrapper.new
  end

  test "should be able to send search with one word" do
    VCR.use_cassette("search") do
      term = "gummy"
      response = EdamamApiWrapper.search(term)

      assert_not_nil response
      # the "shareAs" url includes original search term, pre-normalization (in this case: "gummies")
      assert_match /gummy/, response["hits"].first["recipe"]["shareAs"]
    end # VCR
  end

  # test "should be able to send search with two words" do
  #   VCR.use_cassette("search") do
  #   end # VCR
  # end
  #
  # test "should not be able to send search with zero words" do
  #   VCR.use_cassette("search") do
  #   end # VCR
  # end
  #
  # test "should not be able to send search with non-string input" do
  #   VCR.use_cassette("search") do
  #   end # VCR
  # end

end # class
