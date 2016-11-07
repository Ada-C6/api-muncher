require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @setup_recipe = Recipe.new("Bubbling Cocktails", "https://www.edamam.com/web-img/89e/89e2d3970f6b654c553e9051ab14e60e.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_5b4049191087661cfc4219a794bdfc88", "Martha Stewart", "http://www.marthastewart.com/258264/bubbling-cocktails", 1062.38, [{"text"=>"1 cup boiling water", "quantity"=>1.0, "measure"=>"cup", "food"=>"water", "weight"=>237.0}, {"text"=>"1 cup sugar", "quantity"=>1.0, "measure"=>"cup", "food"=>"sugar", "weight"=>200.0}, {"text"=>"2 cups packed mint leaves", "quantity"=>2.0, "measure"=>"cup", "food"=>"mint leaf", "weight"=>51.2}, {"text"=>"6 kiwis, peeled and quartered", "quantity"=>6.0, "measure"=>"medium", "food"=>"kiwis", "weight"=>414.0}, {"text"=>"1 liter club soda", "quantity"=>1.0, "measure"=>"liter", "food"=>"club soda", "weight"=>1000.8951}], ["Low-Fat", "Low-Sodium"], ["Vegan", "Vegetarian", "Dairy-Free", "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"])
  end

  test "1. should be able to create a new Recipe object with all required parameters" do
    assert recipe = Recipe.new("bacon", "bacon.com", "bacon.com/uri", "bacon source", "bacon_recipe_url", 333, [{"text"=>"2 tablespoons unflavored powdered gelatin", "quantity"=>2.0, "measure"=>"tbsp",  "food"=>"gelatin", "weight"=>13.8}, {"text"=>"1/2 cup cold water", "quantity"=>0.5, "measure"=>"cup", "food"=>"water", "weight"=>118.5}, {"text"=>"1 cup sugar", "quantity"=>1.0, "measure"=>"cup", "food"=>"sugar", "weight"=>200.0}], ["Low-Fat", "Low-Sodium"], ["Dairy-Free", "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"])

    assert_equal recipe.title, "bacon"
    assert_equal recipe.image_url, "bacon.com"
    assert_equal recipe.calories, 333
  end

  test "2. should raise ArgumentError if insufficient arguments provided" do
    assert_raises ArgumentError do
      Recipe.new()
    end

    assert_raises ArgumentError do
      Recipe.new(76)
    end

    assert_raises ArgumentError do
      Recipe.new("bacon", "bacon.com", "bacon.com/uri", "bacon source", "bacon_recipe_url", 333, ["Low-Fat", "Low-Sodium"], ["Dairy-Free", "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"])
    end
  end

  test "3. self.uri_id should return the unique id from uri" do
    assert_equal @setup_recipe.uri_id, "5b4049191087661cfc4219a794bdfc88"
  end

  test "4. health_and_diet_labels should return both diet and health labels" do
    assert_equal @setup_recipe.health_and_diet_labels, ["Low-Fat", "Low-Sodium", "Vegan", "Vegetarian", "Dairy-Free", "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"]
  end

  test "5. search_results should return only recipe hits" do
    VCR.use_cassette("search") do
      term = "pho"
      search_response = EdamamApiWrapper.search(term)

      results = Recipe.search_results(search_response)

      results.each do |result|
        assert_instance_of Recipe, result
      end # each
    end # VCR
  end
end # class
