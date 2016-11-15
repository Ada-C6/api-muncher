require 'test_helper'
require 'edamam_api_wrapper'

class Edamam_Api_WrapperTest < ActionController::TestCase

  test "Can retrieve results for a valid search query" do
    VCR.use_cassette("search") do
      query = "gooseberry"
      recipes = Edamam_Api_Wrapper.search(query, 0)
      assert recipes != false
      assert recipes.length == 10
    end
  end

  test "Can retrieve results for a query that is valid but has no results" do
    VCR.use_cassette("search") do
      query = "Guinea Pig with Hollandaise Sauce"
      recipes = Edamam_Api_Wrapper.search(query, 0)
      assert recipes != false
      assert recipes == []
    end
  end

  test "Search returns false for a query with an invalid from index" do
    VCR.use_cassette("search") do
      query = "gooseberry"
      recipes = Edamam_Api_Wrapper.search(query, 'potatoes')
      assert recipes == false
    end
    VCR.use_cassette("search") do
      query = "gooseberry"
      recipes = Edamam_Api_Wrapper.search(query, -26)
      assert recipes == false
    end
  end

  test "Can retrieve a valid recipe by its URI identifier" do
    VCR.use_cassette("getrecipe") do
      query = "_268cd8fd4c02be3bf706284c9779d942"
      recipe = Edamam_Api_Wrapper.getrecipe(query)
      assert recipe != false
      assert_equal recipe.name, "Gooseberry jam"
    end
  end

  test "Cannot retrieve a result using an invalid URI identifier" do
    VCR.use_cassette("getrecipe") do
      query = "I LOVE CHIHUAHUAS"
      recipe = Edamam_Api_Wrapper.getrecipe(query)
      assert recipe == false
    end
    VCR.use_cassette("getrecipe") do
      query = -27.3
      recipe = Edamam_Api_Wrapper.getrecipe(query)
      assert recipe == false
    end
  end

  test "Can retrieve the maximum results length for a valid query" do
    # Query with more than 100 hits should give max of 100 given limitation of our API plan
    VCR.use_cassette("length") do
      query = "chicken"
      numhits = Edamam_Api_Wrapper.getnumhits(query)
      assert numhits == 100
    end
    # Query with less than 100 hits should give actual number of hits, and not the often
    # incorrect number of hits listed in the results array
    VCR.use_cassette("length") do
      query = "sephardic"
      numhits = Edamam_Api_Wrapper.getnumhits(query)
      assert_equal numhits, 36
      assert numhits != 41 #Reported (incorrect) results count for this particular query
    end
    # Query with no results yields a length of 0
    VCR.use_cassette("length") do
      query = "Braised Guinea Pig with Salsa and Balsamic Reduction"
      numhits = Edamam_Api_Wrapper.getnumhits(query)
      assert_equal numhits, 0
    end
  end

end
