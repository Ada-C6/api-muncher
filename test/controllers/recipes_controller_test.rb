require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "listrecipes returns an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end







  

  # This should work and I have no idea why it isn't.
  # There is a recipe - #<Recipe:0x007fab5e6f6678>.
  # It has a label - Grilled Deviled Chickens Under a Brick
  # But I get ActionView::Template::Error: undefined method `label' for nil:NilClass
  test "should show the show page for a specific recipe" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      recipes.each do |recipe|
        # puts recipe
        # puts recipe.label
        # @label = recipe.label - Tried this reassignment - didn't work.
        get :show, { id: recipe.label }
        assert_response :success
        assert_template :show
      end
    end
  end














  test "should show the next page of 10 recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      get :next
      assert_equal recipes.count, 10
    end
  end
end
