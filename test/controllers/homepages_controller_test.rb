require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  test "should get the index page" do
    get :index
    assert_response :success
    assert_template 'homepages/index'
  end

end
