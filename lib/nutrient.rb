class Nutrient
	attr_accessor :id, :name, :quantity, :unit, :percent_dv
	

	 def initialize(nutrient_hash)
		@id = nutrient_hash[:id]
		@name = nutrient_hash[:name]
		@quantity = nutrient_hash[:quantity].to_f
		@unit = nutrient_hash[:unit]
		@percent_dv= nutrient_hash[:percent_dv]
		# begin
		# 	@percent_dv=@percent_dv.to_i 
		# rescue
		# 	@percent_dv
		# end
  	end 

  	def self.set_rec_values
  		@rec_values={}
		csv_text = File.read(File.join(Rails.root, 'app','assets','data', 'dv_data.csv'))
		csv = CSV.parse(csv_text)
		csv.each do |row|
			next if row[1]==nil
			# puts row[1]
			# puts row[0]
 			@rec_values[row[0]]=row[1].to_f
 		end
 		return @rec_values
 	end

 	REC_VALUES=Nutrient.set_rec_values

	def self.calc_percent_dv(quantity,the_rec)
		return "no recommendation" unless the_rec.class==Float
		puts "quantity: #{quantity}"
		puts "the rec: #{the_rec}"
		begin
			a=((quantity/the_rec)*100)
			puts "the percent dv: #{a}"
		rescue
			a="no recommendation"
		end 
		return a
	end     
         
    def self.make_nutrients_from_api(api_data_hash)
	    nutrients=[]

	    api_data_hash.keys.each do |key|
	      nutrients<<Nutrient.new({
	        id: key,
	        name: api_data_hash[key]['label'] ,
	        quantity: api_data_hash[key]['quantity'].to_f,
	        unit: api_data_hash[key]['unit'],
	        percent_dv: calc_percent_dv(api_data_hash[key]['quantity'].to_f, REC_VALUES[key])
	         })
			
	    end

	    nutrients[0].name="Calories"
	    return nutrients
	end
end