require 'test_helper'
require 'edamam_api_wrapper'
require 'results'

class EdamamApiTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Can retrieve a list of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listresults("chicken")

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |r|
        assert r.is_a? Recipe_Results
      end
    end
  end

  # test "Retrieves nil when the app-id is wrong" do
  #   VCR.use_cassette("bad-id") do
  #     recipes = EdamamApiWrapper.listresults ("bad-id")
  #     assert recipes == nil
  #   end
  # end

  
end
