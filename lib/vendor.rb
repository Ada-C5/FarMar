class FarMar::Vendor
	def initialize(csv_data)
		@csv_data 		= 	csv_data
		@vendor_id 		= 	@csv_data[:vendor_id]
		@vendor_name 	=		@csv_data[:vendor_name]
		@employees 		= 	@csv_data[:employees]
		@market_id 		=		@csv_data[:market_id]
	end 

	def self.all
		vendors = []

		CSV.open('./support/markets.csv', 'r') do |csv|
		  csv.read.each do |line|
		   vendors << self.new(
		   	vendor_id: 		line[0].to_i,
		   	vendor_name: 	line[1].to_s,
		   	employees: 		line[2].to_i,
		   	market_id:		line[3].to_i,
		   )
		 end
		end
		return vendors 
	end

	def self.find(vendor_id)
		return vendor_id
	end

end