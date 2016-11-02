#recipesearch.rb

#NOTE dietlabels, health labels, cautions, ingredientlines, ingredients, totalNutrients, totalDaily show up as arrays (ingredients is an array of hashes)

require 'recipesearchwrapper'

class RecipeSearch
	attr_reader :label, :id, :photo_url, :recipe_url

	def initialize(uri, label, params = {})
		if uri == nil || uri == "" || label == nil || label == ""
			raise ArguementError
		end

		@uri = uri   #aka id
		@label = label
		@image = params["image"]
		@shareas = params["shareas"] #link to the recipe on edamam website, as opposed to the source website

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