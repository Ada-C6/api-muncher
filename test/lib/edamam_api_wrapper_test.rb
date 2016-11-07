require 'test_helper'
require 'edamam_api_wrapper'
require 'results'

class EdamamApiTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "Can retrieve a list of recipes" do
    VCR.use_cassette("recipes") do
      recipes = EdamamApiWrapper.listresults("chicken",nil,nil)

      assert recipes.is_a? Array
      assert recipes.length > 0
      recipes.each do |r|
        assert r.is_a? Recipe_Results
      end
    end
  end

  test "Retrieves nil when the app-id is wrong" do
    VCR.use_cassette("bad-id") do
      recipes = EdamamApiWrapper.listresults("chicken","bad-id",nil)
      assert recipes == nil
    end
  end

  test "Retrieves nil when the app-key is wrong" do
    VCR.use_cassette("bad-key") do
      recipes = EdamamApiWrapper.listresults("chicken",nil,"bad-key")
      assert recipes == nil
    end
  end

  test "returns no recipes when nothing is searched" do
    VCR.use_cassette("nothing-searched") do
      recipes = EdamamApiWrapper.listresults("",nil,nil)
      assert recipes.length == 0
    end
  end

  test "can retrieve a proper search" do
    VCR.use_cassette("get-search") do
      recipes = EdamamApiWrapper.listresults("tofu",nil,nil)
      assert_not response["ok"]
      # assert recipes["more"]
    end
  end
end
