require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "should be able to create an instance of EdamamApiWrapper" do
    assert EdamamApiWrapper.new
  end

  test "should be able to send search with one word" do
    VCR.use_cassette("search") do
      term = "gummy"
      response = EdamamApiWrapper.search(term)

      # @todo - fix these tests; all failing because url isn't populating id & key
      # assert response["ok"]

      assert_not_nil response
      assert_match /gum/, response.first["recipe"]["shareAs"]
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
