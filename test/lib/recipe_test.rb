require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with a label" do
    label = "Best Test Ever!"
    recipe = Recipe.new(label)
    assert_kind_of Recipe, recipe
    assert_equal recipe.label, label
  end

  # test "Recipe.all should return an array of recipes" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all
  #     assert_kind_of Array, recipes
  #     assert_not recipes.empty?
  #     recipes.each do |recipe|
  #       assert_kind_of Recipe, recipe
  #     end
  #   end
  # end

  test "Recipe.search should return an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
        assert recipe.label.downcase.include?("chicken")
      end
    end
  end

  test "Recipe.search should return an empty array if no match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("this-recipe-is-a-savoflange-for-testing-only")
      assert recipes.empty?
      assert_kind_of Array, recipes
    end
  end

end
