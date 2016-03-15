class FarMar::Market
	CSV_DATA = './support/markets.csv'

	attr_reader :market_id, :market_name, :address, :city,
							:county,		:state,				:zip_code

	def initialize(all_markets)
		@market_id 		= 	all_markets[:market_id]
		@market_name 	=		all_markets[:market_name]
		@address 			= 	all_markets[:address]
		@city 				=		all_markets[:city]
		@county 			= 	all_markets[:county]
		@state 				= 	all_markets[:state]
		@zip_code 		= 	all_markets[:zip_code]
	end 

	def self.all

		all_markets = CSV.read(CSV_DATA)

		all_markets.collect do |row|
	   	individual_market =	{
	   	market_id: 		row[0].to_i,
	   	market_name: 	row[1].to_s,
	   	address: 			row[2].to_s,
	   	city:  				row[3].to_s,
	   	county: 			row[4].to_s,
	   	state: 				row[5].to_s,
	   	zip_code:			row[6].to_s
	   }
		self.new(individual_market)
		end
	end

	def self.find(market_id)
		matched_market = nil
		self.all.each do |market|
			if market.market_id == market_id
				matched_market = market
				return matched_market
			end 
		end
	end 
end 
