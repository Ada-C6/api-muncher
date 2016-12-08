require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "should get search" do
    VCR.use_cassette("recipe") do
      # EdamamApiWrapper.search_recipes("chicken", 3)
      get :search, {search: "chicken", page: "2"}
      assert_response :success
    end
  end

  test "should get show" do
    VCR.use_cassette("recipe") do
      get :show, {recipe: "c42a650a96e7b1317b924d8b6c50553d"}
      assert_response :success
    end
  end

  test "should redirect when the user searches with a uri - 32 length and numbers" do
    VCR.use_cassette("recipe") do
      recipe_id = "c42a650a96e7b1317b924d8b6c50553d"
      get :search, {search: recipe_id , page: "2"}
      assert_redirected_to show_recipe_path(recipe_id)
    end
  end

  test "a flash error occurs if the pages go below 1" do
    VCR.use_cassette("recipe") do
      get :search, {search: "durian" , page: "0"}
      assert_equal "Page number may not be less than 1", flash[:error]
    end
  end

  test "@page will default to 1 if user tries to go below 1" do
    VCR.use_cassette("recipe") do
      get :search, {search: "durian" , page: "0"}
      page = assigns(:page)
      assert_equal 1, page
    end
  end

  test "a flash error occurs when there are no more recipes to display" do
    VCR.use_cassette("recipe") do
      get :search, {search: "durian" , page: "2"}
      assert_equal "Pages only exist when their are recipes to display.", flash[:error]
    end
  end

  test "@page will default to @last_page if user tries to go beyond the last page" do
    VCR.use_cassette("recipe") do
      get :search, {search: "durian" , page: "2"}
      page = assigns(:page)
      last = assigns(:last_page)
      assert_equal last, 1
      assert_equal 1, page
      assert_equal last, page
    end
  end

  test "@last_page is the last page of recipes" do
    VCR.use_cassette("recipe") do
      get :search, {search: "yellow curry tofu" , page: "1"}
      last = assigns(:last_page)
      assert_equal last, 4
    end
  end

end
