require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  # INSTANCE METHODS
  test "Recipe can be created with label and uri" do
    label = "just a string"
    uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_10e962aff67fafd7b8506ee963cfbe08"
    recipe = Recipe.new(label, uri)
    assert_equal recipe.label, label
  end

  test "Recipe will throw an error without a valid label and uri" do
    label = ""
    uri = ""
    assert_raises ArgumentError do
      Recipe.new(label, uri)
    end
  end

  test "Optional params are stored" do
    label = "just a string"
    uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_10e962aff67fafd7b8506ee963cfbe08"
    options = {
      tags: ["High-Fiber"],
      dietary_info: {
          "ENERC_KCAL": {
            "label": "Energy",
            "quantity": 1222.6470206400002,
            "unit": "kcal"
          },
          "FAT": {
            "label": "Fat",
            "quantity": 77.7489292,
            "unit": "g"
          },
          "CHOCDF": {
            "label": "Carbs",
            "quantity": 82.24450338399998,
            "unit": "g"
          },
          "FIBTG": {
            "label": "Fiber",
            "quantity": 15.781098382,
            "unit": "g"
          },
          "SUGAR": {
            "label": "Sugars",
            "quantity": 49.3134308492,
            "unit": "g"
          },
          "PROCNT": {
            "label": "Protein",
            "quantity": 59.887842773,
            "unit": "g"
          },
          "CHOLE": {
            "label": "Cholesterol",
            "quantity": 1030.926,
            "unit": "mg"
          },
          "NA": {
            "label": "Sodium",
            "quantity": 6667.517287639999,
            "unit": "mg"
          }
        },
        url: "http://something.com",
        image_url: "http://somethingelse.com",
        ingredients: [
          "2 tablespoons olive oil",
          "1 medium onion, peeled and diced",
          "3 cloves garlic, peeled and thinly sliced",
          "1/2 – 1 chile pepper (or to taste), stemmed, sliced in half and deseeded, finely diced/minced",
          "1 1/2 teaspoons salt"],
    }
    recipe = Recipe.new(label, uri, options)
    assert_equal recipe.url, options[:url]
    assert_equal recipe.image_url, options[:image_url]
    assert_equal recipe.tags, options[:tags]
    assert_equal recipe.ingredients, options[:ingredients]
    assert_equal recipe.dietary_info[0], options[:dietary_info]["ENERC_KCAL"]
    assert_equal recipe.tags, options[:tags]

  end

  # SELF METHODS with inherited class instance variables
  test "Recipe.search should set @results to an array of up to 10 Recipes and @count" do
    VCR.use_cassette("recipes") do
      Recipe.search("matsutake", 1)
      recipes = Recipe.results
      count = Recipe.count
      assert_kind_of Array, recipes
      assert_not recipes.empty?
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
      assert_kind_of Fixnum, count
    end
  end

  test "Recipe.find should find the memoized recipe using the uri if it exists in @results" do
    VCR.use_cassette("recipes") do
      Recipe.search("matsutake", 1)
      recipe = Recipe.results.first
      assert_equal Recipe.find(recipe.uri), recipe
    end
  end

  test "Recipe.find should make a new API query if it does not exist in @results" do
    VCR.use_cassette("recipes") do
      Recipe.search("matsutake", 1)
      results = Recipe.results
      uri = "93ad9c1dc8c1397ab8b46774fec85e8a"
      recipe = Recipe.find(uri)
      assert_kind_of Recipe, recipe
      assert_not_includes results, recipe
    end
  end
end
