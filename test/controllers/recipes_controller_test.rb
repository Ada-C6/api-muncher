require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get the index" do
    get :index
    assert_response :success
  end


end
