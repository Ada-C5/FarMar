class FarMar::Product
	def initialize(csv_data)
		@csv_data 			= 	csv_data
		@product_id 		= 	@csv_data[:product_id]
		@product_name 	=		@csv_data[:product_name]
		@vendor_id 			= 	@csv_data[:vendor_id]
	end 

	def self.all
		products = []

		CSV.open('./support/products.csv', 'r') do |csv|
		  csv.read.each do |line|
		   products << self.new(
		   	product_id: 		line[0].to_i,
		   	product_name: 	line[1].to_s,
		   	vendor_id: 			line[2].to_i,
		   )
		 end
		end
		return products 
	end

	def self.find(product_id)
		return product_id
	end

end