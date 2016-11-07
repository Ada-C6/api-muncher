require 'test_helper'
require 'edamam_api_wrapper'
require 'recipe'

class Edamam_Api_WrapperTest < ActionController::TestCase

  test "can retrieve recipes from API" do

    VCR.use_cassette("search_results") do
      search_results = Edamam_Api_Wrapper.search_recipes("juice")

      assert search_results.is_a? Array
      assert search_results.length > 0

      search_results.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

  # test "Retrieves nill when the token is wrong" do
  #   VCR.use_cassette("") do
  #     search_results = Edamam_Api_Wrapper.search_recipes ""
  #     assert search_results == nil
  #   end
  # end

# test isn't working either.

  # test "can send properly formattd msg" do
  #   VCR.use_cassette("get_recipe") do
  #     response = Edamam_Api_Wrapper.get_recipe("tes")
  #
  #     assert response["ok"]
  #     assert response["message"]["type"] == "message"
  #     asset response["message"]["subtype"] == "bot_message"
  #   end
  # end












end
