require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  #
  # INSTANCE METHODS
  #

  test "Recipe must be created with a label and an id " do
    label  = "Yummy belly delight"
    id     = "this-id"
    recipe = Recipe.new(label, id)

    assert_equal recipe.label, label
    assert_equal recipe.id, id
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

  test "Recipe.reset should reset recipes to nil" do
    VCR.use_cassette("recipes") do
      Recipe.all('chicken', 1)

      assert_kind_of Array, Recipe.recipes
      assert_operator 10, :>=, Recipe.recipes.length
      assert_not Recipe.recipes.empty?

      Recipe.recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end

      Recipe.reset
      assert_nil Recipe.recipes
    end
  end

  test "Recipe.all should retun the same array until it is reset" do
    VCR.use_cassette("recipes") do
      initial_recipes = Recipe.all('chicken', 1)

      # calls Recipe.all again with a new parameter
      Recipe.all('beef', 1)

      assert_equal initial_recipes, Recipe.recipes

      Recipe.reset
      # calls Recipe.all again with a new parameter
      Recipe.all('beef', 1)

      assert_not_equal initial_recipes, Recipe.recipes
    end
  end

  test "Recipe.by_id should return nil if no match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all('chicken', 1)
      recipe = Recipe.by_id("these-are-not-the-ids-youre-looking-for")
      assert_nil recipe
    end
  end

  test "Recipe.by_id should return the only match" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all('chicken', 1)

      recipes.each do |recipe|
        retrieved_recipe = Recipe.by_id(recipe.id)
        assert_equal recipe, retrieved_recipe
      end
    end
  end
end
