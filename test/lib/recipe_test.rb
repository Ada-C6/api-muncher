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

  # test "Recipe.search(string) should return an empty array if no recipe contains the keyword = string" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.search("asdkjaskjgggiuiugiausgd")
  #     assert_kind_of Array, recipes
  #     assert recipes.empty?
  #   end
  # end

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
