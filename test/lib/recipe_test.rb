require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Recipe can be created with api_hash" do
    api_hash = {name: "Test Recipe", yield: 3}
    recipe = Recipe.new(api_hash)
    assert_equal api_hash[:name], recipe.name
    assert_equal api_hash[:yield], recipe.yield
  end

  # test "Blank recipe will not be created without valid API-provided attributes" do
  #   api_hash = {name: nil, yield: nil}
  #   recipe = Recipe.new(api_hash)
  #   assert_nil recipe
  # end

  test "Recipe.all should return an array of recipes" do
    VCR.use_cassette("recipes") do
      search_term = "chicken"
      page = 1
      recipes = Recipe.all(search_term, page)
      assert_not_empty recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.reset should return nil" do
    VCR.use_cassette("recipes") do
      search_term = "chicken"
      page = 1
      recipes = Recipe.all(search_term, page)
      recipes = Recipe.reset
      assert_nil recipes
    end
  end

  test "Recipe.by_id should return the specific recipe" do
    VCR.use_cassette("recipes") do
      search_term = "chicken"
      page = 1
      recipes = Recipe.all(search_term, page)

      recipes.each do |recipe|
        assert Recipe.by_id(recipe.id), recipe.id
      end
    end
  end

  test "Recipe.by_id should not return an invalid recipe" do
    VCR.use_cassette("recipes") do
      search_term = "ahjskfhfajksfsjkl"
      page = 1
      recipes = Recipe.all(search_term, page)

      assert_nil recipes.first
    end
  end

end
