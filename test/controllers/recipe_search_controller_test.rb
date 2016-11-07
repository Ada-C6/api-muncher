require 'test_helper'

class RecipeSearchControllerTest < ActionController::TestCase
  test "should get index" do
    VCR.use_cassette("search_results") do
      get :index
      assert_response :success
      assert_template :index
    end
  end

  test "should get show for a certain search result" do
    VCR.use_cassette("search_results") do
      recipes = SearchResult.all("crepes")
      recipes.each do |recipe|
        get :show, id: recipe.id
        assert_response :success
        assert_template :show
      end
    end
  end

end
