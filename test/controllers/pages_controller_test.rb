require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "should get search page" do
    get :search
    assert_response :success
  end

  test "index should get recipes according to search term" do
    VCR.use_cassette("recipes") do
      get :index, params: {search: "chicken", page: "1"}
      assert_response :success
    end
  end

  test "get show page" do
    skip
    VCR.use_cassette("recipes") do
      get :show, params: { id: "c468dc28f8b64bb711125cc150b15c25" }
      assert_response :success
    end
  end


end
