require 'test_helper'
require 'edemam_api_wrapper'
require 'recipe'

class EdemamApiTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "can retrieve a list of recipes" do
    VCR.use_cassette("recipes") do # if there isn't a cassestte called channels it will create one and name it so
      recipes = EdemamApiWrapper.request_recipes("chicken")

      assert recipes.is_a? Array
      assert recipes.length > 0 # the array will not be empty
      recipes.each do |rec|
        assert rec.is_a? Recipe # every element is an instance of the Recipe class
      end
    end
  end
  # 
  # test "can retrieve a single recipe and its attributes" do
  #   VCR.use_cassette("single_recipe") do
  #
  #     recipes = EdemamApiWrapper.get_a_recipe(c468dc28f8b64bb711125cc150b15c25)
  #
  #     assert recipe.is_a? Recipe # every element is an instance of the Recipe class
  #     assert_equal recipe.label "Grilled Deviled Chickens Under a Brick"
  #     assert_equal recipe.image "https://www.edamam.com/web-img/5f5/5f51c89f832d50da84e3c05bef3f66f9.jpg"
  #     assert_equal recipe.url "http://www.marthastewart.com/recipe/grilled-deviled-chickens-under-a-brick"
  #
  #   end
  # end
  #
  #
  # test "can't send an invalid search request " do
  #   VCR.use_cassette("bad-search") do
  #     response = EdemamApiWrapper.list_recipes("")
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #
  #     response = EdemamApiWrapper.list_recipes(nil)
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #
  #     response = EdemamApiWrapper.list_recipes("1234")
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #
  #     response = EdemamApiWrapper.list_recipes("#$%&@")
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #
  #   end
  # end


end
