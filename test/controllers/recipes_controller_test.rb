require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "(index) will retrieve first 10 recipes" do
    VCR.use_cassette("recipes") do

      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      get :index
      assert_response :success
     end
  end
  test "(next) should get the next page" do
    VCR.use_cassette("recipes") do

      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      get :next
      assert_response :success
    end
  end
end
