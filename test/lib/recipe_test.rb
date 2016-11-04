require 'test_helper'
require 'recipe'
require 'muncher_api_wrapper'


class RecipeTest < ActionController::TestCase

	test "to make recipes you must provide an array" do
		assert_raises(ArgumentError) do
			Recipe.make_recipes_from_api("hello")
		end
		assert_nothing_raised do
			Recipe.make_recipes_from_api([])
		end
	end 

	test "must be an array of hashes(filled) or empty array" do
		assert_raises(ArgumentError) do
			Recipe.make_recipes_from_api([[],[],[]])
		end
		assert_raises(ArgumentError) do
			Recipe.make_recipes_from_api(["string","string","string"])
		end
		assert_raises(NoMethodError) do
			Recipe.make_recipes_from_api([{},{},{}])
		end
		assert_nothing_raised do
			Recipe.make_recipes_from_api([])
		end
		assert_nothing_raised do
			VCR.use_cassette("cheese_recipes") do 
				recipes=MuncherApiWrapper.search("cheese")
				Recipe.make_recipes_from_api(recipes)
			end
		end
	end 

	# test "Name attribution is set correctly" do
	# 	test_me = Slack_Channel.new("my_name", "my_id")
	# 	assert test_me.name == "my_name"
	# end

	# test "ID attribution is set correctly" do
	# 	test_me = Slack_Channel.new("my_name", "my_id")
	# 	assert test_me.id == "my_id"
	# end



end