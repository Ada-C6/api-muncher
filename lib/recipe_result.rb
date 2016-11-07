#recipe_result.rb

#NOTE dietlabels, health labels, cautions, ingredientlines, ingredients, totalNutrients, totalDaily show up as arrays (ingredients is an array of hashes)

# require_relative 'recipe_search_wrapper'

class RecipeResult
	attr_reader :uri, :label, :image, :url, :shareas, :ingredients, :calories, :totalNutrients, :totalDaily
	# def initialize(uri, label, image, url)
		def initialize(recipe_details)
		
		@label = recipe_details['label']


		@uri = ""
    real_uri = false

    recipe_details['uri'].each_char do |character|
      if character == "_"
        real_uri = true
      end

      if real_uri
        @uri << character
      end
    end

		if @uri == nil || @uri == "" || @label == nil || @label == ""
			raise ArgumentError
		end

		@image = recipe_details['image']
		@url = recipe_details['url']
		@shareas = recipe_details['shareas'] #link to the recipe on edamam website, as opposed to the source website
		@ingredients = recipe_details['ingredients']
		@calories = recipe_details['calories']
		@totalNutrients = recipe_details['totalNutrients']
		@totalDaily = recipe_details['totalDaily']
	end


end






	# 	@uri = uri   #aka id
	# 	@label = label
	# 	@image = params["image"]
	# 	# @source = recipe["source"]
	# 	# @sourceicon = recipe["sourceicon"] #
	# 	# @url = recipe["url"] #link to recipe on source website
	# 	@shareas = params["shareas"] #link to the recipe on edamam website, as opposed to the source website
	# 	# @recipe_yield = recipe["recipe_yield"]
	# 	# @dietabels = recipe["dietLabels"]
	# 	# @healthabels = recipe["healthlabels"]
	# 	# @cautions = recipe["cautions"]
	# 	# @ingredientines = recipe["ingredientlines"]
	# 	# @ingredients = recipe["ingredients"]
	# 	# @calories = recipe["calories"]
	# 	# @totalweight = recipe["totalweight"]
	# 	# @totalnutrients = recipe["totalnutrients"]
	# 	# @totaldaily = recipe["totaldaily"]
	# end