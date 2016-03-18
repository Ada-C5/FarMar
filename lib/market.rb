class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(info={})
    @id = info[:id].to_i
    @name = info[:name]
    @address = info[:address]
    @city = info[:city]
    @county = info[:county]
    @state = info[:state]
    @zip = info[:zip].to_i
  end

  def self.all(file = "./support/markets.csv")
    # market_array = []
    market = CSV.read(file)
    market.map do |line|
      hash = {
        :id => line[0],
        :name => line[1],
        :address => line[2],
        :city => line[3],
        :county => line[4],
        :state => line[5],
        :zip => line[6]
      }
      # market_array <<
      FarMar::Market.new(hash)
    end
    # return market_array
  end

  def self.find(id)
    markets = self.all
    markets.each do |found_market|
      return found_market if id == found_market.id
    end
    return nil
  end

  def vendors
    market_id = @id#self.id
    FarMar::Vendor.by_market(market_id)
  end

end
