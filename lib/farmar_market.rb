
class FarMar::Market
  attr_reader :market_id, :nam, :address, :city, :county, :state, :zip
  def initialize(market_info) #for all, csv length -1?
    @market_id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def read_csv
    CSV.open('../support/markets.csv')
  end

  def self.all
    market_instances = []
    self.pull_from_csv.each do |market|
      market_info = {
        id: market[0],
        name: market[1],
        address: market[2],
        city: market[3],
        county: market[4],
        state: market[5],
        zip: market[6]
      }
      new_market = FarMar::Market.new(market_info)
      market_instances << new_market
    end
      market_instances
  end
end

# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located
