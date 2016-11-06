require 'test_helper'

# Adding in the code to fix the pagination Next button bug greatly lowered my recipes controller coverage.
# Despite writing passing tests around that code and making assertions, my tests do not map to my simplecov report.
# (Resulting in ony 62.07% coverage for the recipes controller, despite making some tests.)

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
  # When it errors, code coverage for recipe.rb and EdamamApiWrapper.rb go to 100%, and drop below 100% when this passes.
  test "(show) should obtain a recipe by id" do
    VCR.use_cassette("recipes") do
      id = "c468dc28f8b64bb711125cc150b15c25"
      page = 1
      EdamamApiWrapper.recipe_search(id, page)

      recipe = Recipe.by_id(id)

      assert_equal id, recipe.id
      assert_not_nil recipe
    end
  end

  test "(show) should not obtain a recipe with an invalid id" do
    VCR.use_cassette("recipes") do
      id = "d468dc28f8b64bb711125cc150b15c25"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(id, page)
      recipe = Recipe.by_id(id)
      assert_equal [], recipe
    end
  end

  test "a search term with more than 1000 recipes will assign 1000 to @total_recipe_num" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      get :index
      assert_response :success

      recipes.each do |recipe|
        assert_equal 1000, recipe.total_recipe_num
      end
    end
  end

  test "a search term with less than 100 recipes will assign that specific number to @total_recipe_num" do
    VCR.use_cassette("recipes") do
      search_term = "Durian"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      recipe = recipes.first
      assert_equal 9, recipe.total_recipe_num
    end
  end

  test "a search term with more than 100 recipes will result in a true @more_items_after" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      recipe = recipes.first
      assert_equal true, recipe.more_items_after
    end
  end

  test "a search term with less than or equal to 100 recipes will result in a false @more_items_after" do
    VCR.use_cassette("recipes") do
      search_term = "Durian"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      recipe = recipes.first
      assert_equal false, recipe.more_items_after
    end
  end

end
