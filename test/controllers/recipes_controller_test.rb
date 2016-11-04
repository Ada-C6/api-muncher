require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
 
	test "should show a recipe " do
		VCR.use_cassette("cheese_recipes") do 	
			session[:term]= "cheese"
			get :show , id: 1
			assert_response :success
		end
	end

	test "if the id does not exist it should render a 404 page" do
		VCR.use_cassette("bad_id") do 	
			assert_raises(ActionController::RoutingError) do
				session[:term]= "cheese"
				get :show , id: 80000
			end
		end
	end

	test "if id is 0 it should render a 404 page" do
		VCR.use_cassette("bad_id") do 	
			assert_raises(ActionController::RoutingError) do
				session[:term]= "cheese"
				get :show , id: 0
			end
		end
	end

	test "if id is negative it should render a 404 page" do
		VCR.use_cassette("bad_id") do 	
			assert_raises(ActionController::RoutingError) do
				session[:term]= "cheese"
				get :show , id: -1
			end
		end
	end

	test "should perform a search and return the results" do
		VCR.use_cassette("cheese_recipes") do
			get :search, term: "cheese"
			assert_response :success
		end
	end

	test "if no hits, flash notice informs the user to search again" do
		VCR.use_cassette("no_hits") do
			get :search, term: "xyzzy"
			assert_response :success
			assert_equal flash[:notice], "No recipes matched your search term. Search again"
		end
	end

end
