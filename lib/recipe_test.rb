require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "#index will display first batch of recipe results" do
    VCR.use_cassette("recipes") do

      search_term = "tofu"
      page = 1
      results = Recipe.all(search_term, page)

      get :index
      assert_response :success
      assert_equal 10, results.length
      assert_kind_of Array, results

      #check recipes are of Recipe kind
      results.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "#index will display no recipes found if zero recipes from api" do
    VCR.use_cassette("recipes") do

      search_term = "nothinemptyzero"
      page = 1
      results = Recipe.all(search_term, page)

      get :index
      assert_response :success
      assert_equal 0, results.length
      assert_kind_of Array, results
    end
  end

  test "#show will display detailed info about recipe given a recipe uri" do
    VCR.use_cassette("recipes") do

      results = Recipe.all("seitan", 1)
      recipe = results[2]
      get :show, {id: recipe.uri}
      assert_response :success
      assert_template :show
      assert_kind_of Recipe, recipe
    end
  end

  test "index should be able to render many pages up to 10 if there are 100 or more results" do
    VCR.use_cassette("recipes") do
      results = Recipe.all("tofu", 10)
      get :index
      assert_response :success
      assert_equal 10, results.length
      assert_kind_of Array, results
    end
  end

end
