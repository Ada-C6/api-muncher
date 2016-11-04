require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "1. should get new" do
    get :new
    assert_response :success
  end

  test "2. index should show search results with one search term" do
    VCR.use_cassette("search") do
      get :index, { search_term: "strawberry" }

      assert_template :index
      assert_response 200
    end
  end

  test "3. index should display error & re-render new search if no terms entered" do
    get :index, { search_term: "" }

    assert_template :new
    assert_match /search/, flash[:error]
  end

  test "4. index should display error & re-render new search if only whitespaces entered" do
    get :index, { search_term: "          " }

    assert_template :new
    assert_match /search/, flash[:error]
  end

  # @todo - remove below; original version below (using create action)
  # test "2. should create search with one search term" do
  #   VCR.use_cassette("search") do
  #     get :create, { search_term: "strawberry" }
  #
  #     assert_redirected_to recipes_path
  #   end
  # end
  #
  # test "3. should display error & re-render new search if no terms entered" do
  #   get :create, { search_term: "" }
  #
  #   assert_template :new
  #   assert_match /search/, flash[:error]
  # end
  #
  # test "4. should display error & re-render new search if only whitespaces entered" do
  #   get :create, { search_term: "          " }
  #
  #   assert_template :new
  #   assert_match /search/, flash[:error]
  # end
  #

  # @todo tests in recipes controller: - results with valid single-word input - results with valid multiple-word input -
end
