require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "search should show the search form" do
    get :search
    assert_response :success
  end

  test "index should get index" do

    VCR.use_cassette("recipes") do
      get :index, {search: "chocolate cheesecake graham cracker"}
      assert_response :success
    end
  end

  test "show should get the specific page" do
    VCR.use_cassette("recipes") do
      recipe = EdamamWrapper.find("http://www.edamam.com/ontologies/edamam.owl#recipe_5aa8ce3aed2294da655465a983860794")
      get :show, {id: recipe.uri}
      assert_response :success
      assert_template :show
    end
  end
end
