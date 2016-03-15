## use this when testing in IRB, otherwise comment out
#require_relative '../far_mar'

class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]

  end

# in charge of creating the instances.
  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_markets = CSV.read("./support/markets.csv")
    # returns a collection of instances, representing all of the objects described in the CSV
    all_markets.collect do |market|

      single_market_hash = {
        id: market[0],
        name: market[1],
        address: market[2],
        city: market[3],
        county: market[4],
        state: market[5],
        zip: market[6]
      }
      FarMar::Market.new(single_market_hash)
    end
  end

  def self.find(given_id)
    found_market = nil
    self.all.each do |market|
      if market.id == given_id
        found_market = market
      end
    end
    found_market
  end
end
