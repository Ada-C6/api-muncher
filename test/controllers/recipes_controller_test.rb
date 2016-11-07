require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get index" do
    VCR.use_cassette("recipes") do
      get :index
      assert_response :success

      # index should initially not be populated when no keyword is searched
      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      assert recipes.empty?


    end
  end

  test "index should show at most 10 recipes when passed a keyword" do
    VCR.use_cassette("recipes") do
      get :index, keyword: 'chicken'
      assert_response :success

      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      check_recipes = Recipe.all('chicken', 1)
      recipes.each_with_index do |recipe, index|
        assert_equal recipe, check_recipes[index]
      end

      assert_operator 10, :>=, recipes.length
    end
  end

  test "should get show for a recipe based on id" do
    VCR.use_cassette("recipes") do
      user_search     = Recipe.all('chicken', 1)
      selected_recipe = user_search[0]

      get :show, id: selected_recipe.id
      assert_response :success

      recipe = assigns(:recipe)
      assert_equal recipe, selected_recipe
    end
  end

  test "Next will change the recipes displayed (either previous or next)" do
    VCR.use_cassette("recipes") do
      # start at two so we can compare the output without dealing with corner cases.
      # View helpers prevent navigation from occuring below page 0.
      starting_page = 2
      #
      # Test for next results
      #
      get :next, keyword: 'chicken', page: starting_page + 1
      assert_response :success
      assert_template :index

      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      # check that recipes are different from those displayed on the
      # original page
      check_recipes = Recipe.all('chicken', starting_page)
      recipes.each_with_index do |recipe, index|
        assert_not_equal recipe, check_recipes[index]
      end

      assert_operator 10, :>=, recipes.length

      #
      # Test for previous results
      #
      get :next, keyword: 'chicken', page: starting_page - 1
      assert_response :success
      assert_template :index

      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      # check that recipes are different from those displayed on the
      # original page
      check_recipes = Recipe.all('chicken', starting_page)
      recipes.each_with_index do |recipe, index|
        assert_not_equal recipe, check_recipes[index]
      end

      assert_operator 10, :>=, recipes.length
    end
  end

end
