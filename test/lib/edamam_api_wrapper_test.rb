require 'test_helper'
require 'edamam_api_wrapper'
require 'recipe'

class EdamamRecipeTest < ActionController::TestCase
  #just to verify  that Rake can pick up the test
  test "the truthiness" do
    assert true
  end


  test "bad id fails" do
    VCR.use_cassette("bad_id") do
      response = EdamamApiWrapper.list_recipes "chicken", "bad_id", nil
      assert response == nil
    end
  end

  test "bad key fails" do
    VCR.use_cassette("bad_key") do
      response = EdamamApiWrapper.list_recipes "chicken", nil, "bad_key"
      assert response == nil
    end
  end

  test "receive 100 results" do
    VCR.use_cassette("results") do
      response = EdamamApiWrapper.list_recipes "cupcake", nil, nil
      assert response.size == 100
    end
  end

  test "non-real query gives an empty hits array" do
    VCR.use_cassette("wrog;brr") do
      response = EdamamApiWrapper.list_recipes "wrog;brr"
      assert response.size == 0
    end
  end

  test "can retrieve a list of recipes" do
    VCR.use_cassette("channels") do
      recipes = EdamamApiWrapper.list_recipes "chocolate"

      assert recipes.is_a? Array
      recipes.each do |recipe|
        assert recipe.is_a? Recipe
      end
    end
  end

end
