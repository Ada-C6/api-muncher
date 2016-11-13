require 'test_helper'

class PagesControllerTest < ActionController::TestCase # ActionController::TestCase??

  test "whether the tests are running" do
     assert true
   end

  test "should get index" do
    VCR.use_cassette("recipes") do
      get :index, params: {search: "steak", page: "1"}
      assert_response :success
    end
  end

  test "should get show" do
    VCR.use_cassette("recipes") do
      get :show, params: {id: "1356a760a73b96460168435f7d997d7e"}
      assert_response :success
    end
  end

    test "should get search" do
     VCR.use_cassette("recipes") do
       get :search, params: {search: "paella", page: "20"}
       assert_response :success
     end
   end
end
