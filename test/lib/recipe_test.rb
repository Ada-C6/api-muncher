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

  test "Recipe.search(string) should return nil if no recipe contains the keyword = string" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("asdkjaskjgggiuiugiausgd")
      assert_kind_of Array, recipes
      assert recipes.empty?
    end
  end
end
