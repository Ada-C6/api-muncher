require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
 
	test "should get show" do
		VCR.use_cassette("cheese_recipes") do 	
			session[:term]= "cheese"
			get :show , id: 1
			assert_response :success
		end
	end

	test "if the id does not exist it should render a 404 page" do
		VCR.use_cassette("bad_id") do 	
			session[:term]= "cheese"
			get :show , id: 80000
			assert_raises(ActionController::RoutingError)
		end
	end

	test "should perform a search and return the results" do
		VCR.use_cassette("cheese_recipes") do
			get :search, term: "cheese"
			assert_response :success
		end
	end
end
