require 'test_helper'

class RecipefindersControllerTest < ActionController::TestCase
  test "should get recipefinders index (main index/search page of site)" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get multi-recipe show page given valid, result-yielding parameters" do
    VCR.use_cassette("search") do
      get :show, {query: "chicken", from: 0}
      assert_response :success
      assert_template :show
      assert_equal assigns(:recipes).length, 10
      assert_equal assigns(:count), 100
    end
  end

  test "should get (blank, 'try again' version of) multi-recipe show page given valid parameters that yield no results" do
    VCR.use_cassette("search") do
      get :show, {query: "Guinea Pig with Hollandaise Sauce", from: 0}
      assert_response :success
      assert_template :show
      assert_equal assigns(:recipes), []
      assert_equal assigns(:count), 0
    end
  end

  test "should get (blank, 'try again' version of) multi-recipe show page given parameters that are out of range for the query" do
    VCR.use_cassette("search") do
      get :show, {query: "gooseberry", from: 90}
      assert_response :success
      assert_template :show
      assert_equal assigns(:recipes), []
      assert_equal assigns(:count), 77
    end
  end

  test "should redirect from multi-recipe show method to index given invalid parameters that result in an error code" do
    VCR.use_cassette("search") do
      get :show, {query: "gooseberry", from: 'potatoes'}
      assert_response :redirect
      assert_redirected_to recipefinders_index_path
      assert_equal flash[:notice], "Sorry, that request could not be fulfilled. Please try again."
    end
    VCR.use_cassette("search") do
      get :show, {query: "gooseberry", from: -26}
      assert_response :redirect
      assert_redirected_to recipefinders_index_path
      assert_equal flash[:notice], "Sorry, that request could not be fulfilled. Please try again."
    end
  end

end
