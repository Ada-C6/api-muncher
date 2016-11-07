require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    test "EdamamApiWrapper.search_results will return an array. The first index of the array is an array of Recipes on a valid search term. The second index of the array is the total_items 'count' for the given search term." do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("avocado", 1)
            assert_kind_of Array, recipes
            assert_kind_of Array, recipes[0]
            assert_not recipes[0].empty?
            recipes[0].each do |recipe|
                assert_kind_of Recipe, recipe
            end
            assert_kind_of Integer, recipes[1]
        end
    end

    test "EdamamApiWrapper.search_results will again return an array. The first index will return an empty array on an invalid search term. The second index will return 0 as the 'count'." do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("gobblygook", 1)
            assert_kind_of Array, recipes
            assert recipes[0].empty?
            assert_kind_of Integer, recipes[1]
            assert_equal 0, recipes[1]
        end
    end

    test "EdamamApiWrapper.find_one will return one recipe object given a valid URI" do
        valid_uri = "7b359790eab01e56f8f58ed075b78f9d"
        VCR.use_cassette("recipes") do
            recipe = EdamamApiWrapper.find_one(valid_uri)
            assert_kind_of Recipe, recipe
        end
    end

    test "EdamamApiWrapper.find_one will return nil given a valid URI" do
        invalid_uri = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
        VCR.use_cassette("recipes") do
            recipe = EdamamApiWrapper.find_one(invalid_uri)
            assert_nil recipe
        end
    end
end
