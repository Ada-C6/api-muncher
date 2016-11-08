require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "a Recipe can be created with id, label, photo, url, ingredients, diet information" do
    id = "recipe_test1243"
    label = "test"
    photo = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjG6Jaero7QAhUCxVQKHfH3Ds0QjRwIBw&url=https%3A%2F%2Fwww.haskell.org%2Fhappy%2F&psig=AFQjCNEviGUSPsBvalSiM3rC6_UCXJoJTg&ust=1478323429480108"
    url = "https://github.com/Ada-C6/api-muncher"
    ingredients = ["beef", "egg"]
    diet = ["non-dairy", "soy-free"]
    recipe = Recipe.new(id, label, photo, url, ingredients, diet)
    
    assert_equal recipe.id, id
    assert_equal recipe.label, label
    assert_equal recipe.photo, photo
    assert_equal recipe.url, url
    assert_equal recipe.ingredients, ingredients
    assert_equal recipe.diet, diet
  end

  test "a Recipe object cannot be created when id, label, url or ingredients are unavailable." do
    id = nil
    label = nil
    photo = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjG6Jaero7QAhUCxVQKHfH3Ds0QjRwIBw&url=https%3A%2F%2Fwww.haskell.org%2Fhappy%2F&psig=AFQjCNEviGUSPsBvalSiM3rC6_UCXJoJTg&ust=1478323429480108"
    url = nil
    ingredients = []
    diet = ["non-dairy", "soy-free"]

    assert_raises ArgumentError do
      Recipe.new(id, label, photo, url, ingredients, diet)
    end
  end

  # I decided to abort the rest of my model methods as Dan said my way of storing session is "illegitimate"...


  # test for negative case of constructor

  # test "Recipe.all(search_term) should return an array of recipes that match the search term in parameter" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all("beef")
  #     assert_kind_of Array, recipes
  #     assert_not recipes.empty?
  #     recipes.each do |recipe|
  #       assert_kind_of Recipe, recipe
  #     end
  #   end
  # end

  # test "Recipe.search_by(id) should return the only match" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all("beef") # we need to call this first . will this affect the number of requests to API server?
  #     id = "recipe_c17944a7af0decc2f627246b0bb24d8a"
  #     recipe = Recipe.search_by(id)
  #     assert_kind_of Recipe, recipe
  #     assert_equal recipe.id, id
  #     # assert_equal recipe.label, label : this test is not passing
  #   end
  # end

  # test "Search results are preserved without reset" do
  #   VCR.use_cassette("recipes") do
  #     recipes = Recipe.all("beef")
  #     # check that results are as expected
  #
  #     recipes = Recipe.all("crab")
  #     # check that results haven't changed
  #   end
  # end
end
