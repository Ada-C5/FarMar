class FarMar::Market
	CSV_DATA = './support/markets.csv'

	attr_reader :market_id, :market_name, :address, 	:city,
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
	   	market_name: 	row[1],
	   	address: 			row[2],
	   	city:  				row[3],
	   	county: 			row[4],
	   	state: 				row[5],
	   	zip_code:			row[6]
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

	# is an instance method and already has reference to the market id from test
	def get_vendors
		FarMar::Vendor.all.find_all {|vendor| vendor.market_id == market_id}
	end
end 
