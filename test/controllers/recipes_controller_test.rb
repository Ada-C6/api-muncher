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
    label = "Grilled Deviled Chickens Under a Brick"
    VCR.use_cassette("recipes") do
      get :show, { id: label }

      assert_response :success
      assert_template :show
    end
  end
end
