require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  test "should get search page" do
    get :search
    assert_response :success
  end

  test "should get index of search results" do
    get :index, {search: "search_term"} #{id: tasks(:adas_task).id}
    assert_response :success
  end

  test "should get show page for item" do
    get :show, {name: "item_name"} #{id: tasks(:adas_task).id}
    assert_response :success
  end



end
