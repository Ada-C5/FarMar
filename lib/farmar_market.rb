#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id].to_i
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.all
    all_markets = CSVHasher.hashify('../support/markets.csv')
      all_markets.collect do |n|
        FarMar::Market.new(n)
      end
  end

  def self.find(id)
    id=id.to_i

    all_markets = FarMar::Market.all

    all_markets.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

  def vendors
    all_vendors = FarMar::Vendor.all
    all_vendors.select { |v| @id == v.market_id }
  end

end
