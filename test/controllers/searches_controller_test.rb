require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  # setup do
  #   @search = searches(:one)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  # @todo - test create 

  # test "should create search" do
  #   assert_difference('Search.count') do
  #     post :create, search: {  }
  #   end
  #
  #   assert_redirected_to search_path(assigns(:search))
  # end
end
