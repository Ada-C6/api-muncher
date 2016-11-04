require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "initialize will create a Recipe object" do
    name = "Foodstuffs"
    test_id = "87654345676543456765434567"
    recipe = Recipe.new(name,test_id)

    assert_equal name, recipe.name
    assert_equal test_id, recipe.id
    assert_kind_of Recipe, recipe
  end

  test "initialize will raise Argument Error if name and id are nil" do
    name = nil
    test_id = nil

    assert_raises(ArgumentError) do
      Recipe.new(name,test_id)
    end
  end

  # test "Recipe.all returns an array of Recipe objects" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all
  #
  #     assert_kind_of Array, recipes
  #     assert_not recipes.empty?
  #
  #     recipes.each do |recipe|
  #       assert_kind_of Recipe, recipe
  #     end
  #   end
  # end
end
