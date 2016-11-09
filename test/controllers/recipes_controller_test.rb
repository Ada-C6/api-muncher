require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "that the tests are running" do
    assert true
  end

  test "get index" do
    VCR.use_cassette("recipes") do
      get :index
      assert_response :success

      get :index, {"q" => "tofu", "page" => "3"}
      assert_response :success
    end
  end

  test "get show for a specific recipe" do
    VCR.use_cassette("recipe") do
      uri = "d6687789d38704e912beb94def4b2106"
      results = Recipe.all("kale", 1)
      recipe = results[0]
      get :show, {id: recipe.uri}
      assert_response :success
      assert_template :show
      assert_kind_of Recipe, recipe
      assert_equal uri, recipe.uri
    end
  end
end
