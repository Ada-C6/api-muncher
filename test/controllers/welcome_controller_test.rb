require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
