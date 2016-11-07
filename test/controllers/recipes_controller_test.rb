require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "index returns the index page" do
    VCR.use_cassette("recipes") do
      get :index
      assert_response :success
      assert_template :index
    end
  end

  test "show should display the specific recipe" do
    VCR.use_cassette("recipes") do
      get :show, {identifier: "3eb3f05395f798171be45d54ac87a11f"}
      assert_response :success
      assert_template :show
      assert_equal assigns(:recipe).label, "Potato Cake"
    end
  end

  test "results should show a flash notice for a search that has no results" do
    VCR.use_cassette("recipes") do
      get :results, {search: "ththththt"}
      assert_equal flash[:no_results], "Sorry! Your search term did not find any results."
    end
  end
end
