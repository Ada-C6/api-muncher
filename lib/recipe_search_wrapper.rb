#recipe_search_wrapper.rb

require 'dotenv'
Dotenv.load!
require 'httparty'
require_relative 'recipe_result'
require_relative 'sample-recipe-result'

class RecipeSearchWrapper
	attr_reader :uri, :label, :image, :shareas, :url, :ingredients, :calories, :totalNutrients



#CONSTANTS
#hide that information away!
	APP_ID = ENV["APP_ID"]
	APP_KEY = ENV["APP_KEY"]

	BASE_URL = "https://api.edamam.com/search?"

# /CONSTANTS




#CREATE A WRAPPER 
	def initialize(uri)
		@uri = uri   #aka id
	end



#helps users find recipes by an ingredient

#changed to 100 for will_paginate
	def self.search_by_one_keyword(keyword, list_start = 0, list_end = 100, my_app_id = nil, my_app_key = nil )
		my_app_id ||= APP_ID
		my_app_key ||= APP_KEY

		url = BASE_URL + "q=#{keyword}" + "&app_id=#{my_app_id}" + "&app_key=#{my_app_key}" + "&from=#{list_start}" + "&to=#{list_end}"

#THIS IS WHERE THE MAGIC HAPPENS, MY JSON HASH
		data = HTTParty.get(url)

		recipes = []

		if data["hits"]
			
			results_array = data["hits"]
			
			results_array.each do |result|

				wrapper = RecipeResult.new(result["recipe"])

				recipes << wrapper

			end
			
			return recipes
		
		else

			return nil
		
		end
	end

	def self.show_just_one_recipe(recipe_uri)
		my_app_id ||= APP_ID
		my_app_key ||= APP_KEY
 		
 		url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe#{recipe_uri}" + "&app_id=#{my_app_id}" + "&app_key=#{my_app_key}"
		#THIS IS WHERE THE MAGIC HAPPENS, MY JSON HASH
		data = HTTParty.get(url)


		recipe = RecipeResult.new(data.first)
			
		return recipe


	end
end

