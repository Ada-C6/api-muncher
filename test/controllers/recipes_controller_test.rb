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
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      get :next
      assert_equal recipes.count, 10
    end
  end
end
