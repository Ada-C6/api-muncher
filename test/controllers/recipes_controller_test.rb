require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "(index) will retrieve first 10 recipes" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      names = []
      names[0] = "Grilled Deviled Chickens Under a Brick"
      names[1] = "Herbes de Provence Rotisserie Chickens"
      names[2] = "Sunday Supper: Jerk Half-Chickens"
      names[3] = "Herbes de Provence Rotisserie Chickens"
      names[4] = "Roasted Chickens With Lemon And Orange"
      names[5] = "Spring Chickens with Green Marinade"
      names[6] = "Sage Pesto Roasted Chicken"
      names[7] = "Mustard-Crusted Roast Chickens"
      names[8] = "Chicken Mole"
      names[9] = "Herb-Roasted Chickens"

      recipes.each_with_index do |recipe, index|
        unless recipes.last
          assert_equal names[index], recipe.name
        end
      end
    end
  end
end
