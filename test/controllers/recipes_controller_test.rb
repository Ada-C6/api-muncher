require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get the index page" do
    get :index
    assert_response :success
  end

  test "should return a collection of Recipe Objects" do
    get :index, { name: "chicken" }
    assert_response :success
    assert_template :index
  end
end
