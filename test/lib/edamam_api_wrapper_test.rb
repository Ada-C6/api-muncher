require 'test_helper'
require 'edamam_api_wrapper'
require 'results'

class EdamamApiTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Can retrieve a list of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listresults("chicken")

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |r|
        assert r.is_a? Recipe_Results
      end
    end
  end

  test "Retrieves nil when the app-id is wrong" do
    VCR.use_cassette("bad-id") do
      recipes = EdamamApiWrapper.listresults ("bad-id")
      assert recipes == nil
    end
  end

  # test "Can send a properly formatted msg" do
  #   VCR.use_cassette("send-msg") do
  #     response = SlackApiWrapper.sendmsg("test-api-parens","do the thing!!!")
  #     assert response["ok"]
  #     assert response["message"]["type"] == "message"
  #     assert response["message"]["subtype"] == "bot_message"
  #   end
  # end
  #
  # test "won't send a message to a channel that doesn't exist" do
  #   VCR.use_cassette("bad-channel") do
  #     response = SlackApiWrapper.sendmsg("cheezits-rock","yea they do!")
  #     assert_not response["ok"]
  #     assert_equal response["error"], "channel_not_found"
  #   end
  # end
  #
  # test "won't send a message fails" do
  #   VCR.use_cassette("bad-msg") do
  #     response = SlackApiWrapper.sendmsg("test-api-parens","")
  #     assert_not response["ok"]
  #     assert_equal response["error"], "no_text"
  #     response = SlackApiWrapper.sendmsg("test-api-parens",nil)
  #     assert_not response["ok"]
  #     assert_equal response["error"], "no_text"
  #   end
  # end
  #
  # test "sending a message with a bad token fails" do
  #   VCR.use_cassette("bad-msg-token") do
  #     response = SlackApiWrapper.sendmsg("test-api-parens","Failed message","12345")
  #     assert_not response["ok"]
  #     assert_equal response["error"],"invalid_auth"
  #
  #     response = SlackApiWrapper.sendmsg("test-api-parens","Failed message","")
  #     assert_not response["ok"]
  #     assert_equal response["error"],"not_authed"
  #   end
  # end
end
