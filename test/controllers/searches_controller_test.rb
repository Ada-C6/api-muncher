require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search with one search term" do
    VCR.use_cassette("search") do
      get :create, { search_term: "strawberry" }

      assert_redirected_to recipes_path
    end
  end

  test "should display error & re-render new search if no terms entered" do
    get :create, { search_term: "" }

    assert_template :new
    assert_match /search/, flash[:error]
  end

  test "should display error & re-render new search if only whitespaces entered" do
    get :create, { search_term: "          " }

    assert_template :new
    assert_match /search/, flash[:error]
  end


  # @todo tests in recipes controller: - results with valid single-word input - results with valid multiple-word input -
end
