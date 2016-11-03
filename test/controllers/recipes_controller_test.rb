require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get index" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      assert_kind_of Array, recipes
      get :index
      assert_response :success
    end
  end

  test "listrecipes returns an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  # This should work and I have no idea why it isn't. Neither did 2 TAs.
  # There is a recipe - #<Recipe:0x007fab5e6f6678>.
  # It has a label - Grilled Deviled Chickens Under a Brick
  # But I get ActionView::Template::Error: undefined method `label' for nil:NilClass
  # And now (the next day), I'm getting this error: expecting <"show"> but rendering with <[]>
  # I think it's somehow getting to 'show.html.erb' and breaking, but I don't know why or how
  test "should show the show page for a specific recipe" do
    # label = "Grilled Deviled Chickens Under a Brick" # - tried hard coding it - fail.
    VCR.use_cassette("recipes") do
      # get :show, { id: label } # went along with hard-coding - fail.
      recipes = EdamamApiWrapper.listrecipes("chicken", 1)
      recipes.each do |recipe|
      #   # puts recipe
      #   # puts recipe.label
      #   # @label = recipe.label - Tried this reassignment - didn't work.
      #   get :show, { id: recipe.label }
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
