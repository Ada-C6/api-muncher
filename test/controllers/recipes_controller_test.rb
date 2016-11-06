require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "index should show all the recipes from that search" do
    VCR.use_cassette("recipes") do
      get :index, search: "chicken"
      assert_response :success
      assert_template :index
    end
  end

  test "should show the requested recipe" do
    VCR.use_cassette("recipes") do
      recipe_id = "recipe_637913ec61d9da69eb451818c3293df2"
      get :show, id: recipe_id
      assert_response :success
      assert_template :show

      recipe = assigns(:recipe)
      assert_not_nil recipe
      assert_equal recipe.uri[44..-1], recipe_id
    end
  end

  test "doesn't show a non-existant recipe" do
    VCR.use_cassette("recipes") do
      recipe_id = "asdkfjahsdlfkjhadkjlfhalwuiehroqjebflknbclabpiufhqpw8eyr09-q834yr-9gfhpiudgfahjbcl"

      get :show, { id: recipe_id }
      assert_redirected_to no_recipe_path
    end
  end

end
