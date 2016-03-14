class FarMar::Sale

	PENNY_CONVERTER = 100
	
	def initialize(csv_data)
		@csv_data 				= 	csv_data
		@sale_id 					= 	@csv_data[:sale_id]
		@amount 					=		@csv_data[:amount] / PENNY_CONVERTER
		@purchase_time 		= 	@csv_data[:purchase_time]
		@vendor_id 				=		@csv_data[:vendor_id]
		@product_id 			= 	@csv_data[:product_id]

	end 

	def self.all
		sales = []

		CSV.open('./support/markets.csv', 'r') do |csv|
		  csv.read.each do |line|
		   sales << self.new(
		   	sale_id: 				line[0].to_i,
		   	amount: 				line[1].to_i,
		   	purchase_time: 	line[2].to_s,
		   	vendor_id:  		line[3].to_i,
		   	product_id: 		line[4].to_i
		   )
		 end
		end
		return sales 
	end

	def self.find(sale_id)
		return sale_id
	end
end