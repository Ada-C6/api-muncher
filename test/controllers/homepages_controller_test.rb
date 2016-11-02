require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {search: "search_term"} #{id: tasks(:adas_task).id}
    assert_response :success
  end



end
