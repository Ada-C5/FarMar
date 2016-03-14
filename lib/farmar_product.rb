require_relative '../far_mar'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

def initialize(market_hash)
  @id = market_hash[:id]
  @name = market_hash[:name]
  @vendor_id = market_hash[:vendor_id]
end

end
