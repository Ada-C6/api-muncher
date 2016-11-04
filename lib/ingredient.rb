class Ingredient
	attr_accessor  :text, :id, :quantity, :measure, :food
       
    def initialize(ingredient_hash)
		@text = ingredient_hash[:text]
		@id = ingredient_hash[:id]
		@quantity = ingredient_hash[:quantity].to_f
		@measure = ingredient_hash[:measure]
		@food = ingredient_hash[:food]
  	end       
         
    def self.make_ingredients_from_api(ingredient_array)
	    raise ArgumentError unless ingredient_array.class == Array 
	    raise ArgumentError unless ingredient_array.all? { |item|item.class==Hash && !(item.empty?)}
	    ingredients=[]

	    ingredient_array.each_with_index do |ingredient_hash, index|
	      ingredients<<Ingredient.new({
	        text: ingredient_hash['text'],
	        id: (index+1).to_s,
	        quantity: ingredient_hash['quantity'].to_f,
	        measure: ingredient_hash['measure'],
	        food: ingredient_hash['food']
	         })
	    end
	    return ingredients
	end
end
