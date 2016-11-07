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
      assert_kind_of Array, assigns(:recipes)
      assert_empty assigns(:recipes)
      assert_equal flash[:no_results], "Sorry! Your search term did not find any results."
    end
  end

  test "results should display list of results when provided with a good search term" do
    VCR.use_cassette("recipes") do
      get :results, {search: "chicken"}
      assert_response :success
      assert_template :results
      assert_kind_of Array, assigns(:recipes)
      assert_not_empty assigns(:recipes)
    end
  end

  test "show should show a flash notice for a request with a bad recipe identifier" do
    VCR.use_cassette("recipes") do
      get :show, {identifier: "chicken"}
      assert_nil assigns(:recipe)
      assert_equal flash[:no_results], "Sorry! we can't find this recipe."
    end
  end
end
