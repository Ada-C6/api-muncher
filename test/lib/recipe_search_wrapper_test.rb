require 'test_helper'
require 'recipe_search_wrapper'

class RecipeSearchWrapperTest < ActionController::TestCase

#make sure rake is picking up the test
	test "the truth" do
		assert true
	end

	test "Can Retrieve a List of Recipes" do
		
		VCR.use_cassette("recipe-list") do 
			
			recipes = RecipeSearchWrapper.search_by_one_keyword("carrot")

			assert recipes.length > 0
			assert recipes.is_a? Array
			assert_not recipes.is_empty?
		end
		

	end 

	test "Searches without a Keyword Fail" do
		VCR.use_cassette("no-keyword") do
			recipes = RecipeSearchWrapper.search_by_one_keyword("")

			assert recipes == nil
		end
	end


	# test "Retrieves Nil When the App ID is Wrong" do 
	# 	VCR.use_cassette("bad-token") do
	# 		recipes = RecipeSearchWrapper.search_by_one_keyword("carrot", "bad-token")

	# 		assert recipes == Error 500
	# 	end
	# end 

		test "Retrieves Nil When the App Key is Wrong" do 
		VCR.use_cassette("bad-key") do
			recipes = RecipeSearchWrapper.search_by_one_keyword("carrot", "bad-token")

			assert recipes == nil
		end
	end 

	test "Retrieves Nil When the Keyword is not an Option" do 
		VCR.use_cassette("bad-keyword") do
			recipes = RecipeSearchWrapper.search_by_one_keyword("grok")

			assert recipes == nil
		end
	end 
end