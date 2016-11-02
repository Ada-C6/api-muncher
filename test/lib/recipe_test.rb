require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  #
  # INSTANCE METHODS
  #

  test "Recipe can be created with name and api_hash" do
    name = "test name"
    api_hash = {"test" => "hash"}
    c = Recipe.new(name, api_hash)
    assert_equal c.name, name
    assert_equal c.api_hash, api_hash
  end

  #
  # SELF methods
  #

  test "Recipe.all should return an array of recipes" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.all
      assert_not recipes.empty?
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Channel.by_name should return nil if no match" do
    VCR.use_cassette("recipes") do
      channel = Channel.by_name("this-channel-does-not-exist")
      assert_nil channel
    end
  end

  test "Recipe.by_name should return the only match" do
    VCR.use_cassette("recipes") do
      name = "Grilled Deviled Chickens Under a Brick"
      channel = Recipe.by_name(name)
      assert_kind_of Recipe, recipes
      assert_equal recipe.name, name
    end
  end
end
