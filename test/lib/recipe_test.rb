require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "a recipe is create with a label" do
    label = "test label"
    c = Recipe.new(label)
    assert_equal c.label, label
  end

  test "Recipe.search(string) should return an array of recipes containing keyword = string" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("chicken")
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.search(string) should return an empty array if no recipe contains the keyword = string" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("asdkjaskjgggiuiugiausgd")
      assert_kind_of Array, recipes
      assert recipes.empty?
    end
  end

  # test "Recipe.by_label should return only the match" do
  #   VCR.use_cassette("recipes") do
  #     label = "Grilled Deviled Chickens Under a Brick"
  #     recipe = Recipe.by_label(label)
  #     assert_kind_of Recipe, recipe
  #     assert_equal recipe.label, label
  #   end
  # end
  #
  # test "Recipe.by_label should return the first match" do
  #   VCR.use_cassette("recipes") do
  #     # NOTE, "Herbes de Provence Rotisserie Chickens" is an actual piece of data that repeats multiple times.
  #     recipe = Recipe.by_label("Herbes de Provence Rotisserie Chickens")
  #     assert_kind_of Recipe, recipe
  #     assert_equal recipe.label, "Herbes de Provence Rotisserie Chickens"
  #     assert_equal recipe.link, "http://www.bonappetit.com/recipes/2007/07/herbes_de_provence_rotisserie_chickens"
  #     # This is the link associated with the the second entry
  #     assert_not_equal recipe.link, "http://www.epicurious.com/recipes/food/views/Herbes-de-Provence-Rotisserie-Chickens-238794"
  #   end
  # end
end
