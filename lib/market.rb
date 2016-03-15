# require_relative '../far_mar'

class FarMar::Market
  FILENAME = "./support/markets.csv"
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_data)
    @id = market_data[:id].to_i # fixnum
    @name = market_data[:name] #string
    @address = market_data[:address] #string
    @city = market_data[:city] #string
    @county = market_data[:county] #string
    @state = market_data[:state] #string
    @zip = market_data[:zip] #string
  end

  def self.all # self is the class and all is the method
    market_collection = []
    CSV.open(FILENAME, "r") do |csv|
    csv.read.each do |line|
      market_collection << self.new( id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6] )
    end
    end
    return market_collection
  end

  def self.find(id)
    all_markets = self.all
    all_markets.each do |market|
      while market.id == id
        return market #an instance
      end
    end
    return nil
  end

  def vendors
  # one market has an id.
  # many vendors can have one specific market_id
    all_vendors = FarMar::Vendor.all # list of all vendors
    list_of_this_markets_vendors = [] # empty array
    all_vendors.each do |vendor| # all of the vendors going through each vendor
      if vendor.market_id == id # go to the vendors market_id and check with current instance of what the market(renton or fremont) id
        list_of_this_markets_vendors << vendor
      end
    end
    return list_of_this_markets_vendors
    # all_vendors.select do |vendor| #
    # vendor.market_id == id
    # end
  end

end
