require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get the index page when submitting a search term" do
    VCR.use_cassette("results") do
      search_term = "eggs"
    
      get :index, {search: search_term}
      assert_response :success
      assert_template :index
    end
  end

  test "should get the show page with results" do
    VCR.use_cassette("results") do
      search_term = "eggs"
      get :show, {id: search_term}

      recipe = assigns(:recipe)
      assert_response :success
      assert_template :show
      assert_not_nil recipe

    end
  end

end
