require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get individual show page for a valid recipe" do
    VCR.use_cassette("getrecipe") do
      get :show, {id: "_268cd8fd4c02be3bf706284c9779d942"}
      assert_response :success
      assert_template :show
      assert_equal assigns(:recipe).name, "Gooseberry jam"
    end
  end

  test "should redirect to index page with a flash notice for an invalid recipe" do
    VCR.use_cassette("getrecipe") do
      get :show, {id: "I LOVE CHIHUAHUAS"}
      assert_equal assigns(:recipe), false
      assert_response :redirect
      assert_redirected_to recipefinders_index_path
      assert_equal flash[:notice], "Sorry, that recipe could not be found. Please try a new search!"
    end
    VCR.use_cassette("getrecipe") do
      get :show, {id: -27.3}
      assert_equal assigns(:recipe), false
      assert_response :redirect
      assert_redirected_to recipefinders_index_path
      assert_equal flash[:notice], "Sorry, that recipe could not be found. Please try a new search!"
    end
  end

end
