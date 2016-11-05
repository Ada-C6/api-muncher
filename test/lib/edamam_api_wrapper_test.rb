require 'test_helper'
require 'edamam_api_wrapper'
require 'recipe'


class EdamamApiTest < ActionController::TestCase
  test "the truth" do
    assert true
  end


  test "can retrieve a list of recipes" do
    VCR.use_cassette("hits") do
      recipes = EdamamApiWrapper.list_recipes("chicken")

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |r|
        assert r.is_a? Recipe
    end
  end
end

  test 'when there is a blank search, an empty array is returned' do
      VCR.use_cassette('blank-search') do
        recipes = EdamamApiWrapper.list_recipes(nil)
        assert_empty(recipes)
      end
    end

  test "can retrieve a single recipe" do
    VCR.use_cassette('show_one') do
      recipe = EdamamApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_4a97965157df17841696bbbcc8a27935")
      assert recipe.is_a? Recipe
    end
  end

  test "Returns empty array if given search term doesn't match any recipes" do
    VCR.use_cassette("total_none_matching") do
      total = EdamamApiWrapper.list_recipes("pecan gravy pudding")
      assert_equal total, []
      assert total.is_a?(Array)
    end
  end


end
