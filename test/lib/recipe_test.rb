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

  test "Recipe.all should retun an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.by_name should return nil if no match" do
    VCR.use_cassette("recipes") do
      recipe = Recipe.by_name("this-food-does-not-exist")
      assert_nil recipe
    end
  end

  test "Recipe.by_name should return the only match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.by_name("chicken")
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end
end
