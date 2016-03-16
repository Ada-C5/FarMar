class FarMar::Market
  attr_accessor :market_id, :market_name, :market_address, :market_city,
                :market_county, :market_state, :market_zip

  def initialize(id, name, address, city, county, state, zip)
    @market_id = id
    @market_name = name
    @market_address = address
    @market_city = city
    @market_county = county
    @market_state = state
    @market_zip = zip
  end

  def self.all
    CSV.read('support/markets.csv').collect { |row| self.new(row[0].to_i,row[1],row[2],row[3],row[4],row[5],row[6]) }
  end


  def self.find(id)
    FarMar::Market.all.each do |market|
      if market.market_id == id.to_i
        return market
      end
    end
  end

  def vendors
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id.to_i }
  end

end
