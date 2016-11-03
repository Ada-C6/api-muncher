require 'test_helper'
require 'muncher_api_wrapper'
# require 'recipe'

class MuncherApiTest < ActionController::TestCase

	test "the truth" do
		assert true
	end

	test "Can retrieve a list of recipes that matches a search term" do 
		VCR.use_cassette("cheese_recipes") do 
			recipes=MuncherApiWrapper.search("cheese")
			assert recipes.is_a? Array
			assert_not_empty recipes
			recipes.each do |r|
				assert r.is_a? Hash
			end
		end
	end

	test "If there are no hits, then you are told to search again" do 
		VCR.use_cassette("not_there") do 
			recipes=MuncherApiWrapper.search("xyzzy")
			assert recipes.is_a? Array
			assert_empty recipes
		end
	end


	# test "retrieves nil when the token is wrong" do
	# 	VCR.use_cassette("bad-token") do 
	# 		recipes=MuncherApiWrapper.search("bad-token","cheese")
	# 		assert recipes==nil
	# 	end
	# end

	# test "can send a properly formatted message" do
	# 	VCR.use_cassette("send-msg") do
	# 		response=MuncherApiWrapper.sendmsg("test-api-parens", "we need some :sunny:")
		
	# 		assert response["ok"]
	# 		assert response["message"]["type"]="message"
	# 	end
	# end

	# test "if the channel doesn't exist, then user gets an error" do 
	# 	VCR.use_cassette("bad_channel") do
	# 		response=MuncherApiWrapper.sendmsg("doesnt_exist", "we need some :sunny:")
	# 		assert_not response["ok"]
	# 		assert_equal response["error"], "channel_not_found"
	# 	end
	# end

	# test "a non-existent message fails" do 
	# 	VCR.use_cassette("bad-msg") do
	# 		response=MuncherApiWrapper.sendmsg("test-api-parens", "")
	# 		assert_not response["ok"]
	# 		assert_equal response["error"], "no_text"

	# 		response=MuncherApiWrapper.sendmsg("test-api-parens", nil)
	# 		assert_not response["ok"]
	# 		assert_equal response["error"], "no_text"
	# 	end
	# end

	# test "sending a message with a bad token fails" do
	# 	VCR.use_cassette("bad-token-for-msg") do 
	# 		response=MuncherApiWrapper.sendmsg("test-api-parens", "we need some :sunny:", "12345")
	# 		assert_not response["ok"]
	# 		assert_equal response["error"], "invalid_auth"
	# 	end
	# end

	# test "sending a message with no token fails" do
	# 	VCR.use_cassette("bad-token-for-msg") do 
	# 		response=MuncherApiWrapper.sendmsg("test-api-parens", "we need some :sunny:", "")
	# 		assert_not response["ok"]
	# 		assert_equal response["error"], "not_authed"
	# 	end
	# end
end