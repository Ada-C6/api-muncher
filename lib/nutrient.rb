class Nutrient
	attr_accessor :id, :name, :quantity, :unit

	 def initialize(nutrient_hash)
		@id = nutrient_hash[:id]
		@name = nutrient_hash[:name]
		@quantity = nutrient_hash[:quantity].to_f
		@unit = nutrient_hash[:unit]
  	end       
         
    def self.make_nutrients_from_api(api_data_hash)
	    nutrients=[]
	    
	    api_data_hash.keys.each do |key|
	      nutrients<<Nutrient.new({
	        id: key,
	        name: api_data_hash[key]['label'] ,
	        quantity: api_data_hash[key]['quantity'].to_f,
	        unit: api_data_hash[key]['unit']
	         })
	    end
	    nutrients[0].name="Calories"
	    return nutrients
	end
end