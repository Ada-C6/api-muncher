require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  # def search_for_recipe
  #   params[:search_term] = "bbq pork"
  # end


  
  # test "should get the index page when submitting a search term" do
  #   # search_term = "bye"
  #   # search_for_recipe
  #   get :index #, {params: search_term}
  #   assert_response :success
  #   assert_template :index
  # end
    test "should get the index page when submitting a search term" do

  VCR.use_cassette("results") do
    get :index #, {params: search_term}
    assert_response :success
    assert_template :index
  end
end
end
