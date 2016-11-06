require 'test_helper'

class EdamamAPIWrapperTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Can receive information from Edamam API" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      name = "Grilled Deviled Chickens Under a Brick"

      api_hash = {:name=>"Grilled Deviled Chickens Under a Brick", :id=>"c468dc28f8b64bb711125cc150b15c25", :recipe_image=>"https://www.edamam.com/web-img/5f5/5f51c89f832d50da84e3c05bef3f66f9.jpg", :source_url=>"http://www.marthastewart.com/recipe/grilled-deviled-chickens-under-a-brick", :ingredients=>["4 baby chickens (poussins) or cornish hens (about 1 1/4 pounds each), or 4 chicken breast halves", "3 lemons, plus wedges for garnish", "4 cloves garlic, peeled and smashed", "1 tablespoon crushed red-pepper flakes, or to taste", "1 tablespoon finely chopped fresh thyme", "1 tablespoon finely chopped fresh rosemary", "1/2 cup olive oil", "Salt, to taste"], :calories=>5922, :dietary_info=>["Fat: 451.21g", "Saturated: 112.95g", "Trans: 2.04g", "Monounsaturated: 220.5g", "Polyunsaturated: 85.26g", "Carbs: 24.78g", "Carbs (net): 17.44g", "Fiber: 7.34g", "Sugars: 5.19g", "Protein: 425.42g", "Cholesterol: 1700.97mg", "Sodium: 1620.78mg", "Calcium: 342.3mg", "Magnesium: 484.52mg", "Potassium: 4718.14mg", "Iron: 23.25mg", "Zinc: 30.15mg", "Phosphorus: 3400.42mg", "Vitamin A: 1050.16µg", "Vitamin C: 144.22mg", "Thiamin (B1): 1.48mg", "Riboflavin (B2): 2.83mg", "Niacin (B3): 155.01mg", "Vitamin B6: 8.37mg", "Folic Acid (B9): 164.9µg", "Vitamin B12: 7.03µg", "Vitamin D: 4.54µg", "Vitamin E: 24.16mg", "Vitamin K: 103.5µg"], :descriptive_labels=>[["Low-Carb"], ["Paleo", "Dairy-Free", "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free"]], :yield=>4}

      assert true, recipes[200]

      assert_equal name, recipes.first.name
      assert_equal api_hash[:recipe_image], recipes.first.recipe_image
      assert_equal api_hash[:source_url], recipes.first.source_url
      assert_equal api_hash[:ingredients], recipes.first.ingredients
      assert_equal api_hash[:calories], recipes.first.calories
      assert_equal api_hash[:dietary_info], recipes.first.dietary_info
      assert_equal api_hash[:descriptive_labels], recipes.first.descriptive_labels
      assert_equal api_hash[:yield], recipes.first.yield
    end
  end

  test "search_recipe will return an array of Recipes with present search term" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      assert_not recipes.empty?
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        assert_kind_of Recipe, recipe
      end
    end
  end

  # For some reason the test passes but does not map to relevant line 43 in simplecov's coverage report
  test "search should return empty array if invalid search term" do
    VCR.use_cassette("recipes") do
      search_term = "fshjlfksdfjklahsflkjsdhflkjasdhf"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      assert_equal [], recipes
    end
  end
end
