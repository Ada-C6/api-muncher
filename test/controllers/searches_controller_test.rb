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
    VCR.use_cassette("search") do
      get :index, { search_term: "" }

      assert_template :new
      assert_match /search/, flash[:error]
    end
  end

  test "4. index should display error & re-render new search if only whitespaces entered" do
    VCR.use_cassette("search") do
      get :index, { search_term: "          " }

      assert_template :new
      assert_match /search/, flash[:error]
    end
  end

  test "5. index should flash error if no results returned" do
    VCR.use_cassette("search") do
      get :index, { search_term: "12345" }

      assert_template :index
      assert_not_empty assigns(:response)
      assert_empty assigns(:recipe_results)
      assert_match /No recipes/, flash[:no_results]
    end
  end

  test "6. show should get show page for a known uri_id" do
    VCR.use_cassette("search") do
      get :show, { id: "5b4049191087661cfc4219a794bdfc88" }

      assert_template :show
      assert_instance_of Recipe, assigns(:recipe)
      assert_not_empty assigns(:ingredients)
    end
  end

  test "7. show should get show page for a generated uri_id" do
    VCR.use_cassette("search") do
      original_search = EdamamApiWrapper.search("nom")
      recipe_results = Recipe.search_results(original_search)
      first_recipe = recipe_results.first

      get :show, { id: first_recipe.uri_id }

      assert_template :show
      assert_instance_of Recipe, assigns(:recipe)
      assert_not_empty assigns(:ingredients)
    end
  end
end # class
