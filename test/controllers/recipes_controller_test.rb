require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get search page" do
    get :search
    assert_response :success
  end

  test "should get index page with search results" do
    VCR.use_cassette("recipes") do
      search = "matsutake"
      page = "1"
      get :index, { :search => search, "page" => page}
      assert_response :success
      assert_equal assigns[:search_term], search
      assert_equal assigns[:page], page
      assert_equal assigns[:count], 17
      assert_equal assigns[:pages], (assigns[:count]/10.0).ceil
      assert_equal assigns[:results].length, 10
    end
  end
  test "should get limit results to 100 max" do
    VCR.use_cassette("recipes") do
      search = "ham"
      page = "1"
      get :index, { :search => search, "page" => page}
      assert_response :success
      assert_equal assigns[:search_term], search
      assert_equal assigns[:page], page
      assert_equal assigns[:count], 100
      assert_equal assigns[:pages], 10
      assert_equal assigns[:results].length, 10
    end
  end

  test "should get index page with search results, even if there are no results" do
    VCR.use_cassette("recipes") do
      search = "["
      page = "1"
      get :index, { :search => search, "page" => page}
      assert_response :success
      assert_equal assigns[:search_term], search
      assert_equal assigns[:page], page
      assert_equal assigns[:count], 0
      assert_equal assigns[:pages], 1
      assert_equal assigns[:results].length, 0
    end
  end

  test "show page should display a specific Recipe" do
    VCR.use_cassette("recipes") do
      uri = "44c99dd99b004130623c68095b4b58b0"
      get :show, { id: uri }
      assert_response :success
      assert_equal assigns[:recipe].uri, uri
    end
  end

end
