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

	test "Recipe data-types are correct" do
		VCR.use_cassette("cheese_recipes") do 
			recipes=MuncherApiWrapper.search("cheese")
			cheesy=Recipe.make_recipes_from_api(recipes)
			assert cheesy.all?{|c| c.name.class == String}
			assert cheesy.all?{|c| c.id.class == String}
			assert cheesy.all?{|c| c.health_labels.class == Array}
			assert cheesy.all?{|c| c.ingredients.class == Array}
			assert cheesy.all?{|c| c.url.class == String}
			assert cheesy.all?{|c| c.servings.class == Float}
			assert cheesy.all?{|c| c.nutrients.class == Array}
			assert cheesy.all?{|c| c.photo_url.class == String}
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