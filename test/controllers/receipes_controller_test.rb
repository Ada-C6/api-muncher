require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
 
	test "should get show" do
		VCR.use_cassette("cheese_recipes") do 	
			session[:term]= "cheese"
			get :show , id: 1
			assert_response :success
		end
	end

	test "should perform a search and return the results" do
		VCR.use_cassette("cheese_recipes") do
			get :search, term: "cheese"
			assert_response :success
		end
	end
end
