require 'test_helper'
require 'nutrient'

class NutrientTest < ActionController::TestCase
	test "to make nutrients you must provide a hash with stuff in it" do
		assert_raises(ArgumentError) do
			Nutrient.make_nutrients_from_api("hello")
		end
		assert_nothing_raised do
			Nutrient.make_nutrients_from_api({hello: "kewkr", yes: "342"})
		end
	end
end