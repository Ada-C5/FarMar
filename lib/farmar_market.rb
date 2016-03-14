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

end
