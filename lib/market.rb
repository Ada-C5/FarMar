class FarMar::Market
  attr_reader :market_id, :market_name, :address, :city, :county, :state, :zip #these are like the instance variables, but now methods!

    def initialize (market_hash)
      @market_id = market_hash[:market_id]
      @market_name = market_hash[:market_name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]


    end



  def self.all
    market_collection = []
    market_array = []
    market_array = CSV.read("./support/markets.csv", 'r')  #this is reading the csv file and creating and array of arrays


    market_array.each do |market|
      market_hash = {market_id: market[0], market_name: market[1], address: market[2], city: market[3], county: market[4], state: market[5], zip: market[6]}
      new_market = FarMar::Market.new(market_hash)
      market_collection << new_market
    end
      return market_collection  #this is an array of FarMar::Market instances***
  end



  def self.find(id_requested)
    id_requested = id_requested.to_s
    market_array = []
    market_array = self.all
    market_array.each do |market|                     #this is an array of SPECIFIC MARKETS
      if market.market_id == id_requested             #if id matches the user-requested id, do this:
        return market                                 #break out of the loop when you find the id that matches
      end
    end
        return nil                                    #return nil if the id is not found
  end


  def vendors(assoc_market_id)  #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    #FarMar::Vendor.all
    assoc_vendors = []
    FarMar::Vendor.all.each do |vendor|
      if vendor.market_id.to_i == assoc_market_id
        assoc_vendors << vendor
      end
    end
      return assoc_vendors
  end

end
