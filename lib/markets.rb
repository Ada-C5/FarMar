class FarMar::Market
	attr_accessor :id, :name, :address, :city, :county, :state, :zip
	MARKET_DATA = "./support/markets.csv"

	def initialize(market_hash)
		@id = market_hash[:id].to_i
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
				market = FarMar::Market.new(id: line[0].to_i, name: line[1],
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
        end
      end
      return nil		
	end

	#returns a collection of FarMar::Vendor instances that
	#are associated with the market by the market_id field.
	def vendors
		FarMar::Vendor.all.find_all do |vendor|
			vendor.market_id == @id
		end
	end

	#returns a collection of FarMar::Product instances that
	#are associated to the market through the FarMar::Vendor class
	def products
		products = []
		FarMar::Vendor.all.each do |vendor|
			if vendor.market_id == @id
				find_product = FarMar::Product.by_vendor(vendor.id)
				find_product.each do |product|
					products << product
				end
			end
		end
		return products
	end

	#returns a collection of FarMar::Market instances where the 
	#market name or vendor name contain the search_term
	def self.search(search_term)
		market_collection = []
		markets = FarMar::Market.all
		vendors = FarMar::Vendor.all
		search_term = search_term.downcase

		vendors.each do |vendor|
			if vendor.name.downcase.include? search_term
				markets.each do |market|
					if vendor.market_id == market.id
						market_collection << market
					end
				end
			end
		end

		markets.each do |market|
			if market.name.downcase.include? search_term
				market_collection << market
			end
		end
		return market_collection
	end

	#returns the vendor with the highest revenue
	def prefered_vendor
		best_vendor = []
		sum = 0
		max_sum = 0
		FarMar::Vendor.all.each do |vendor|
			if vendor.market_id == @id
				sum = 0
				FarMar::Sale.all.each do |sale|
					if sale.vendor_id == vendor.id
						sum += sale.amount
					end
				end

				if sum > max_sum
					max_sum = sum
					best_vendor = vendor
				end
			end
		end
		return best_vendor
	end	
end