require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # 
  # test "(index) resetting via the Recipe class method clears the results"
  #   VCR.use_cassette("recipes") do
  #     search_term = "Chicken"
  #     recipes = EdamamApiWrapper.recipe_search(search_term)
  #
  #     Recipe.reset
  #     assert_nil recipes
  #   end
end
