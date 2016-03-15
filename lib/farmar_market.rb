class FarMar::Market

	attr_reader :id, :name, :address, :city, :county, :state, :zip_code

	def initialize(market_hash)
	# ID - (Fixnum) a unique identifier for that market
	# Name - (String) the name of the market (not guaranteed unique)
	# Address - (String) street address of the market
	# City - (String) city in which the market is located
	# County - (String) county in which the market is located
	# State - (String) state in which the market is located
	# Zip - (String) zipcode in which the market is located
	
	@id = market_hash[:id]
	@name = market_hash[:name]
	@address = market_hash[:address]
	@city = market_hash[:city]
	@county = market_hash[:county]
	@state = market_hash[:state]
	@zip_code = market_hash[:zip_code]

	end

	def self.all(path_to_csv)

    market_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
      id = row[0]
      name = row[1]
      address = row[2]
      city = row[3]
      county = row[4]
      state = row[5]
      zip_code = row[6]

      market_hash = {id: id, name: name, address: address, city: city, county: county, state: state, zip_code: zip_code}
      market_list << self.new(market_hash)
    end
    market_list
	end

  def self.find(id)
    markets_to_search = FarMar::Market.all("./support/markets.csv")
    found_market = nil

    markets_to_search.each do |market|
      if market.id == id.to_s
        found_market = market
      end
    end

    found_market
  end

  def vendors
    # returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    vendors = FarMar::Vendor.all('./support/vendors.csv')
    vendors_at_market = []

    vendors.each do |vendor|
      if vendor.market_id == self.id
        vendors_at_market << vendor
      end
      vendors_at_market
    end
  end
end