require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "#list_recipes returns an array of recipes that match the search term" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("beef")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
      assert recipes.length <= 100
    end
  end

  # test for parameter search_term = nil
  test "#list_recipes returns an empty array when a user searches with empty parameter/doesn't type any keyword in the textbox" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("")
      assert_kind_of Array, recipes
      assert recipes.empty?
      assert_equal recipes.length, 0
    end
  end

  # test for nil result
  test "#list_recipes returns an empty array when a search query returns no result" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.list_recipes("dasdsada")
      assert_kind_of Array, recipes
      assert recipes.empty?
      assert_equal recipes.length, 0
    end
  end

  test "#list_a_recipe(id) returns a Recipe object that match the id" do
    VCR.use_cassette("recipes") do
      recipe = EdamamApiWrapper.list_a_recipe("recipe_c468dc28f8b64bb711125cc150b15c25")
      assert_kind_of Recipe, recipe
      assert_not recipe.label.empty?
    end
  end

  # I am not testing negative case here because my users will always click on a valid recipe on my index page.
end
