require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "whether the tests are running" do
  #   assert false
  #
  # end

  #
  # INSTANCE METHODS
  #

  test "Recipe can be created with a label" do
    label = "Yummy belly delight"
    recipe = Recipe.new(label)

    assert_equal recipe.label, label
  end

  #
  # SELF METHODS
  #

  test "Recipe.all should retun an array of (at most) 10 recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all('chicken', 1)
      assert_kind_of Array, recipes
      assert_operator 10, :>=, recipes.length
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.by_name should return nil if no match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all('chicken', 1)
      recipe = Recipe.by_label("this-food-does-not-exist")
      assert_nil recipe
    end
  end

  

  # test "Recipe.by_name should return the only match" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all('chicken', 1)
  #     recipes.each do |recipe|
  #       retrieved_recipe = Recipe.by_label(recipe.label)
  #       assert_equal recipe, retrieved_recipe
  #     end
  #   end
  # end
end
