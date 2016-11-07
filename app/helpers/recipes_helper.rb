module RecipesHelper
	def round_to(value, precision)
		if value.is_a? Float
			value.round(precision)
		else
			return value
		end
	end

end
