require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "search gets back a collection of Recipes" do
    VCR.use_cassette("recipes") do
      term = "chicken"
      recipes =  EdamamApiWrapper.search(term)

      assert_kind_of Array, recipes
      assert_not recipes.empty?

      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "find gets back a single recipe" do
    VCR.use_cassette("recipes") do
      id = "4b4dc08187822cb49fb12c1e6ded859f"
      recipe =  EdamamApiWrapper.find_recipe(id)

      assert_kind_of Recipe, recipe
    end
  end
end
