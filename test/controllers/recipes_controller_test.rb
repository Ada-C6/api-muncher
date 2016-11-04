require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get index" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all("chicken", 1)
      assert_kind_of Array, recipes
      get :index
      assert_response :success
    end
  end

  test "should return an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all("chicken", 1)
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "should search for a specific term and return at most those 10 recipes" do
    VCR.use_cassette("recipes") do
      get :index, searchterm: "chicken", page: 1
      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      verify = Recipe.all("chicken", 1)
      recipes.each_with_index do |recipe, index|
        assert_equal verify[index], recipe
      end

      assert_operator 10, :<=, recipes.length
    end
  end

  test "should show the show page for a specific recipe" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all("chicken", 1)
      recipes.each do |recipe|
        get :show, { id: recipe.id }
        assert_response :success
        assert_template :show
      end
    end
  end

  test "Recipe.by_id should return the only match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all("chicken", 1)
      recipes.each do |recipe|
        retrieved_recipe = Recipe.by_id(recipe.id)
        assert_equal recipe, retrieved_recipe
      end
    end
  end

  test "next should show the next page of 10 recipes" do
    VCR.use_cassette("recipes") do
      get :next, searchterm: "chicken", page: 2
      recipes = assigns(:recipes)
      assert_kind_of Array, recipes
      verify = Recipe.all("chicken", 2)
      recipes.each_with_index do |recipe, index|
        assert_equal verify[index], recipe
      end

      assert_operator 10, :<=, recipes.length
    end
  end
end
