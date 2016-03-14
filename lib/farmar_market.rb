#require_relative "../far_mar"

#require File.dirname(__FILE__) + ".."

class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :county, :state, :zip
  # self.all: returns a collection of instances, representing all of the objects described in the CSV
  def initialize(market_info)
    @market_id = market_info[:market_id].to_i
    @name = market_info[:name]
    @address = market_info[:address]
    @city = market_info[:city]
    @county = market_info[:county]
    @state = market_info[:state]
    @zip = market_info[:zip]
  end

  def self.all
    all_market_info = []
    CSV.open("./support/markets.csv", 'r') do |csv|
      csv.read.each do |line|
        all_market_info.push(self.new(market_id: line[0], name: line[1], address: line[2], city: line[3], county:line[4], state: line[5], zip: line[6]))
      end
    end
    return all_market_info
  end

  def self.find(id)
    all_markets = self.all
    all_markets.each do |market|
      if market.market_id == id
        return market
      end
    end
  end
end
