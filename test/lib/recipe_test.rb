require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end


  # self.search
  test "a recipe can not be created without a label" do
    # hit_exception = false
    # begin
    #   Recipe.new(link: "google.com")
    # rescue ArgumentError
    #   hit_exception = true
    # end
    # assert hit_assertion
    assert_raises ArgumentError do
      Recipe.new
    end
  end

  test "Recipe.search(string, page) should return an array of recipes containing keyword = string" do
    VCR.use_cassette("recipes") do
      recipes = Recipe.search("chicken", 1)
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  test "Recipe.search(string, page) where pages are distinct should return different arrays of recipes" do
    VCR.use_cassette("recipes") do
      list_1 = Recipe.search("chicken", 1)
      list_2 = Recipe.search("chicken", 2)
      list_1.each do |recipe|
        assert_not list_2.include?(recipe)
      end
    end
  end

  # self.hit_counts
  test "self.hit_counts should return a single integer" do
    VCR.use_cassette("recipes") do
      counter = Recipe.hit_counts("chicken")
      assert_kind_of Fixnum, counter
    end
  end

  # self.by_uri
  test "self.by_uri should return one object" do
    VCR.use_cassette("recipes") do
      recipe = Recipe.by_uri("98aaada3f6e07dc99b67d63e14fd4735")
      assert_kind_of Recipe, recipe
    end
  end

end
