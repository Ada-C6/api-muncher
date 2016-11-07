require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "index should redirect to index when given a valid search term" do
    VCR.use_cassette("recipes") do
      get :home, search: "pizza"
      # assert_response 302
      assert_redirected_to recipes_search_path("pizza")
    end
  end
  
  test "index should show all the recipes from that search" do
    VCR.use_cassette("recipes") do
      get :index, search: "chicken"
      assert_response :success
      assert_template :index
    end
  end

  test "index flash error when search term not found" do
    VCR.use_cassette("recipes") do
      get :index, search: "jggytgy"
      assert_equal flash[:notice], 'Sorry, no recipes to show.'
    end
end

  test "should get show" do
    VCR.use_cassette("recipes") do
      id = "576b197cd6b49772586df31b16abb592"
      get :show, id: id
      assert_response :success
      assert_template :show
    end
  end

  test "should redirect to root_patha and flash an error when given a bad id " do
    VCR.use_cassette("recipes") do
      id = "576b197cd6b497586df31b16abb592"
      get :show, id: id
      assert_redirected_to root_path
      assert_equal flash[:notice], "Sorry, can't find a recipe with that id."
    end
  end

end
