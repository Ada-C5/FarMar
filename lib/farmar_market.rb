
class FarMar::Market

attr_reader :market_id, :name, :address, :city, :county, :state, :zip

def initialize(market_hash)
@market_id = market_hash[:market_id]
@name = market_hash[:name]
@address = market_hash[:address]
@city = market_hash[:city]
@county = market_hash[:county]
@state = market_hash[:state]
@zip = market_hash[:zip]
end

def self.all
market_array = []
new1 = FarMar::Market.new(market_id: 1, name: "butts", address: "123 butts", city: "spokane", county: "king", state: "washington", zip: 98103)

new2 =  FarMar::Market.new(market_id: 2, name: "butt", address: "123 butt", city: "spok", county: "kin", state: "washingto", zip: 9810)

market_array << new1
market_array << new2
return market_array
end

end
