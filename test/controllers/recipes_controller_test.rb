require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get search" do
    VCR.use_cassette("controller-index") do
      get :index
      assert_response :success
    end
  end

  test "should get list" do
    VCR.use_cassette("controller-list") do
      get :list, {query: "chicken"}
      assert_response :success
    end
  end

  test "should get show" do
    VCR.use_cassette("controller-show") do
      get :show, {uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_ecc112dcc32f9335f07cfcf6bfc5fc22"}
      assert_response :success
    end
  end

  test "should redirect a blank query and or one made of spaces" do
    VCR.use_cassette("blanks-check") do
      get :list, {query: ""}
      assert_response :redirect

      get :list, {query: " "}
      assert_response :redirect

      get :list, {query: "  "}
      assert_response :redirect
    end
  end

end
