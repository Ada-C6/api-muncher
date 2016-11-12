require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_template :home
  end

  test "#index should show search results when user enters a search term" do
    VCR.use_cassette("recipes") do
      get :index, { q: "beef" }
      assert_template :index
      assert_response :success
    end
  end

  test "#index should display error & render an empty index page if no search term was entered" do
    VCR.use_cassette("recipes") do
      search_term = ""
      get :index, { q: search_term }
      assert_template :index
      assert_response :success

      all_results = EdamamApiWrapper.list_recipes(search_term)
      assert_kind_of Array, all_results
      assert all_results.empty?
      assert_equal all_results.length, 0
    end
  end

  test "#index should display error & render an empty index page if a search query returns no result" do
    VCR.use_cassette("recipes") do
      search_term = "dasdsada"
      get :index, { q: search_term }
      assert_template :index
      assert_response :success

      all_results = EdamamApiWrapper.list_recipes(search_term)
      assert_kind_of Array, all_results
      assert all_results.empty?
      assert_equal all_results.length, 0
    end
  end

  test "#show should render a show page for a valid recipe id" do
    VCR.use_cassette("recipes") do
      get :show, { id: "recipe_c468dc28f8b64bb711125cc150b15c25" }
      assert_response :success
      assert_template :show
    end
  end

end
