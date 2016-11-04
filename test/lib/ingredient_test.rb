require 'test_helper'
require 'ingredient'

class IngredientTest < ActionController::TestCase
	test "to make ingredients you must provide an array" do
		assert_raises(ArgumentError) do
			Ingredient.make_ingredients_from_api("hello")
		end
		assert_nothing_raised do
			Ingredient.make_ingredients_from_api([])
		end
	end 

	test "must be an array of hashes or empty array" do
		assert_raises(ArgumentError) do
			Ingredient.make_ingredients_from_api([[],[],[]])
		end
		assert_raises(ArgumentError) do
			Ingredient.make_ingredients_from_api(["string","string","string"])
		end
		assert_raises(ArgumentError) do
			Ingredient.make_ingredients_from_api([{},{},{}])
		end
		assert_nothing_raised do
			Ingredient.make_ingredients_from_api([])
		end
		# assert_nothing_raised do
		# 	VCR.use_cassette("cheese_Ingredients") do 
		# 		cheese_hits=MuncherApiWrapper.search("cheese")
		# 		Ingredient.make_ingredients_from_api(cheese_hits['recipe']['ingredients'])
		# 	end
		# end
	end 

	# test "Ingredient data-types are correct" do
	# 	VCR.use_cassette("cheese_Ingredients") do 
	# 		Ingredients=MuncherApiWrapper.search("cheese")
	# 		cheesy=Ingredient.make_Ingredients_from_api(Ingredients)
	# 		assert cheesy.all?{|c| c.name.class == String}
	# 		assert cheesy.all?{|c| c.id.class == String}
	# 		assert cheesy.all?{|c| c.health_labels.class == Array}
	# 		assert cheesy.all?{|c| c.Ingredients.class == Array}
	# 		assert cheesy.all?{|c| c.url.class == String}
	# 		assert cheesy.all?{|c| c.servings.class == Float}
	# 		assert cheesy.all?{|c| c.nutrients.class == Array}
	# 		assert cheesy.all?{|c| c.photo_url.class == String}
	# 	end
	# end

end