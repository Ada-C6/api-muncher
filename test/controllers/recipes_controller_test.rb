require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "(index) will retrieve first 10 recipes" do
    VCR.use_cassette("recipes") do

      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      get :index
      assert_response :success
      assert_equal 10, recipes.count
     end
  end

  test "(index) will stay at index if invalid search term" do
    VCR.use_cassette("recipes") do

      search_term = "kjalfwjaklsfjklaja;klsfjakls;fjaklsfj"
      page = 1
      EdamamApiWrapper.recipe_search(search_term, page)

      get :index
      assert_response :success
     end
  end

  test "(pagination) pagination should work with search result hits of less than 10 & more than 10" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      EdamamApiWrapper.recipe_search(search_term, page)

      get :pagination
      assert_response :success

      search_term = "Durian"
      page = 1
      EdamamApiWrapper.recipe_search(search_term, page)

      get :pagination
      assert_response :success
    end
  end

  # For some reason this test sometimes randomly errors even after passing consistently with the same test code.
  test "(show) should obtain a recipe by id" do
    VCR.use_cassette("recipes") do
      search_term = "c468dc28f8b64bb711125cc150b15c25"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      
      recipe = recipes.first
      assert_equal search_term, Recipe.by_id(recipe.id).id
      assert_not_nil recipe
    end
  end

  test "(show) should not obtain a recipe with an invalid id" do
    VCR.use_cassette("recipes") do
      search_term = "d468dc28f8b64bb711125cc150b15c25"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      recipe = recipes.first
      assert_nil recipe
    end
  end

end
