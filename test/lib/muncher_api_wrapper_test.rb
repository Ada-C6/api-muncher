require 'test_helper'
require 'muncher_api_wrapper'
# require 'recipe'

class MuncherApiTest < ActionController::TestCase

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

	test "If there are no hits, it returns an empty array" do 
		VCR.use_cassette("not_there") do 
			recipes=MuncherApiWrapper.search("xyzzy")
			assert recipes.is_a? Array
			assert_empty recipes
		end
	end


	test "retrieves nil when the token is wrong" do
		VCR.use_cassette("bad-token") do 
			recipes=MuncherApiWrapper.search("bad-token","cheese")
			assert recipes==nil
		end
	end

	test "If not passed a search term an argument error is thrown" do 
		VCR.use_cassette("no_search_term") do 
			assert_raises(ArgumentError) do
				recipes=MuncherApiWrapper.search()
			end
		end
	end

	test "If passed an empty string an argument error is thrown" do 
		VCR.use_cassette("empty_string") do 
			assert_raises(ArgumentError) do
				recipes=MuncherApiWrapper.search("")
			end
		end
	end
end