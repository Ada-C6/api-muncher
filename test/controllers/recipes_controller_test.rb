require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get index" do
    VCR.use_cassette("recipes") do
      get :index
      assert_response 302

      get :index, {"q" => "butter", "page" => "1"}
      assert_response :success
    end
  end
  
  test "should show the show page for a specified recipe" do
    VCR.use_cassette("recipes") do
      get :show, {data: {uri: "637913ec61d9da69eb451818c3293df2"}}
      assert_response :success
      assert_template :show
    end
  end

  # test "next_page should show the next or previous page of queries with the same keyword" do
  #
  # end
end
