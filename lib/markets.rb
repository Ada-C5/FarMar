
class FarMar::Market
	attr_accessor :ID, :name, :address, :city, :county, :state, :zip
	
	MARKET_DATA = "./support/markets.csv"

	def initialize(market_hash)
		@ID = market_hash[:ID].to_i
		@name = market_hash[:name]
		@address = market_hash[:address]
		@city = market_hash[:city]
		@county = market_hash[:county]
		@state = market_hash[:state]
		@zip = market_hash[:zip]

	end
	#returns a collection of instances, representing all of 
	#the objects described in the CSV
	def self.all
			all = []
			CSV.foreach(MARKET_DATA, "r") do |line|
				market = FarMar::Market.new(ID: line[0].to_i, name: line[1],
					address: line[2], city: line[3], county: line[4],
					zip: line[6])
				all << market
				end
		
		return all
	end

	#returns an instance of the object where the value of the
	# id field in the CSV matches the passed parameter.
	def self.find(id)
		find = []
   		CSV.foreach(MARKET_DATA, "r") do |line|
        if line[0] == id.to_s
          find =[line[0].to_i, line[1], line[2], line[3], 
          		 line[4], line[5], line[6]]
        	return find
        	break
        end
      end
      return nil		
	end

	#returns a collection of FarMar::Vendor instances that
	#are associated with the market by the market_id field.
	def vendor
		vendors = []
		vendors << FarMar::Vendor.all.select{|key,value| key == "market_id" && value == @id} 

	end












end