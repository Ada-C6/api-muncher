require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end
#
# INSTANCE METHODS
#

test "Recipe can be created with label, source, ID" do
  label = "test name"
  identifier = "test id"
  source_site = "test source"
  r = Recipe.new(label, source_site, identifier)
  assert_equal r.label, label
  assert_equal r.identifier, identifier
end

# TODO: Think about adding validations on initializer arguments -- for instance, identifier should be a 32 character string.

#
# SELF METHODS
#
  test "Recipe.all should get back an array of recipes" do
    VCR.use_cassette("recipes") do
      term = "chicken"
      recipes = Recipe.all(term)
      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.all should make an API call if search hasn't been made before; not make API call if term is same as previous search" do
    VCR.use_cassette("recipes") do
      # ensuring that there's not been a search yet. This seems a little sketchy, but I'm noticing that my memoized data is messing up this test depending on what order the tests have run. If I had time, I'd research how to better clear my cache/memoized data. (maybe with a before each for the tests?)
      Recipe.search_term = nil

      term = "couscous"
      Recipe.all(term)

      assert_equal Recipe.api_call, true
    end
  end

  test "Recipe.all should not make API call if term is same as previous search" do
    # Not quite sure how to test memoization
    VCR.use_cassette("recipes") do
      term = "beer"
      Recipe.all(term)

      # call the same search term again, should execute memoized part of method.
      Recipe.all(term)

      assert_equal Recipe.search_term, term
      assert_equal Recipe.api_call, false
    end
  end

  test "Recipe.all should not make API calls for baked searches" do
    VCR.use_cassette("recipes") do
      # ensuring that there's not been a search yet.
      Recipe.search_term = nil

      chicken = "chicken"
      potato = "potato"
      ground_beef = "ground beef"

      recipes = Recipe.all(chicken)

      assert_equal Recipe.chicken_recipes, recipes

      assert_equal Recipe.api_call, false

      recipes = Recipe.all(potato)

      assert_equal Recipe.potato_recipes, recipes

      assert_equal Recipe.api_call, false

      recipes = Recipe.all(ground_beef)

      assert_equal Recipe.ground_beef_recipes, recipes

      assert_equal Recipe.api_call, false

    end
  end


  test "Recipe.find_recipe returns single, correct recipe with valid search params" do
    VCR.use_cassette("recipes") do
      id = "4b4dc08187822cb49fb12c1e6ded859f"
      recipe = Recipe.find_recipe(id)

      assert_kind_of Recipe, recipe
    end
  end

  test "Recipe.find_recipe returns nil if param is invalid" do
    VCR.use_cassette("recipes") do
      bad_ids = ["http://www.something.com", "chicken", "9", 9, 12345, 9.2]

      bad_ids.each do |id|
        recipe = Recipe.find_recipe(id)
        assert_equal recipe, nil
      end
    end
  end

  test "Recipe.find_recipe does make an API call if recipe is not in stored recipes variable" do
    VCR.use_cassette("recipes") do
      # ensuring that there's not been a search yet.
      Recipe.search_term = nil

      chicken_term = "chicken"
      recipes = Recipe.all(chicken_term)
      recipe = recipes.first

      identifier = recipe.identifier

      # resetting the search term and stored recipes variable
      couscous_term = "couscous"
      couscous_recipes = Recipe.all(couscous_term)

      found_recipe = Recipe.find_recipe(identifier)

      assert_not_includes couscous_recipes, recipe

      assert_equal recipe.identifier, found_recipe.identifier

      assert_equal Recipe.api_call, true

    end
  end

  test "Recipe.find_recipe doesn't make an API call if search has been done and recipe already stored" do
    VCR.use_cassette("recipes") do
      term = "chicken"
      recipes = Recipe.all(term)
      recipe = recipes.first

      identifier = recipe.identifier

      found_recipe = Recipe.find_recipe(identifier)

      assert_equal recipe.identifier,found_recipe.identifier

      assert_equal Recipe.api_call, false

    end
  end

end
