require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "(index) will retrieve first 10 recipes" do
    VCR.use_cassette("recipes") do

      search_term = "Chicken"
      page = 1
      EdamamApiWrapper.recipe_search(search_term, page)

      get :index
      assert_response :success
     end
  end

  test "(next) should get the next page" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      EdamamApiWrapper.recipe_search(search_term, page)

      get :next
      assert_response :success
    end
  end

  # test does not work right now
  test "(show) should obtain a recipe by id" do
    VCR.use_cassette("recipes") do
      id = "c468dc28f8b64bb711125cc150b15c25"
      page = 1
      recipe = EdamamApiWrapper.recipe_search(id, page).first

      assert_not_nil recipe
      assert_equal "c468dc28f8b64bb711125cc150b15c25", recipe.id
    end
  end
end
