require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get the index page when submitting a search term" do
    VCR.use_cassette("results") do
      search_term = "eggs"
      # response = EdamamApiWrapper.search(search_term)
      get :index, {search: search_term}
      assert_response :success
      assert_template :index
    end
  end

  test "should get the show page with results" do
    VCR.use_cassette("results") do
      # response = EdamamApiWrapper.search(search_term)
      search_term = "eggs"
      get :show, {id: search_term}
      assert_response :success
      assert_template :show
    end
  end

end
