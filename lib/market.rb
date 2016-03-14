
class FarMar::Market
	def initialize(csv_data)
		@csv_data 		= 	csv_data
		@market_id 		= 	@csv_data[:market_id]
		@market_name 	=		@csv_data[:market_name]
		@address 			= 	@csv_data[:address]
		@city 				=		@csv_data[:city]
		@county 			= 	@csv_data[:county]
		@state 				= 	@csv_data[:state]
		@zip_code 		= 	@csv_data[:zip_code]
	end 

	def self.all
		markets = []

		CSV.open('./support/markets.csv', 'r') do |csv|
		  csv.read.each do |line|
		   markets << self.new(
		   	market_id: 		line[0].to_i,
		   	market_name: 	line[1].to_s,
		   	address: 			line[2].to_s,
		   	city:  				line[3].to_s,
		   	county: 			line[4].to_s,
		   	state: 				line[5].to_s,
		   	zip_code:			line[6].to_s
		   )
		 end
		end
		return markets 
	end

	def self.find(market_id)
		return market_id
	end
end 
