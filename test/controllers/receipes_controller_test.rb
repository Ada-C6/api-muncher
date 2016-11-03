require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

	test "should get show" do
		VCR.use_cassette("cheese_recipes") do 	
			session[:term]= "cheese"
			get :show , id: 1
			assert_response :success
		end
	end

end
