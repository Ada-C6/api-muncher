require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "should get index" do
    VCR.use_cassette("recipes") do
      get :index, { search_term: "chicken" }

      assert_response :success
      assert_template :index
    end
  end

  test "should show recipe" do
    uri = "3f10dadc9f8dbe253c076927204cea50"
    VCR.use_cassette("recipes") do
      get :show, { uri: uri }

      assert_response :success
      assert_template :show
    end
  end
end
