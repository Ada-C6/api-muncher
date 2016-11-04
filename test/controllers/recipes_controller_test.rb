require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get index" do
    VCR.use_cassette("recipes") do
      get :index
      assert_response :success
    end
  end

  # test "should show the show page for a specified recipe" do
  #   VCR.use_cassette("recipes") do
  #     params[:data][:uri] = "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2"
  #     get :show
  #     assert_response :success
  #     assert_template :show
  #   end
  # end

  # test "next_page should show the next or previous page of queries with the same keyword" do
  #
  # end
end
