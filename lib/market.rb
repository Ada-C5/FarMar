require 'csv'

class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  MARKET_FILE = "support/markets.csv"

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.all
    markets = []
    CSV.foreach(MARKET_FILE) do |row|
      markets << FarMar::Market.new(id: row[0].to_i, name: row[1], address: row[2],
      city: row[3], county: row[4], state: row[5], zip: row[6])
    end
    return markets

  end

  def self.find(id)
    markets = self.all
    found_id = nil
    markets.each do |market|
      if market.id == id
        found_id = market
      end
    end
    if found_id == nil
      return "ID not found!"
    else
      return found_id
    end

  end




end
