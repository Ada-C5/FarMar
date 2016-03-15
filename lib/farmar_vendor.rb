class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

def initialize(market_hash)
  @id = market_hash[:id]
  @name = market_hash[:name]
  @employee_num = market_hash[:employee_num]
  @market_id = FarMar::Market.id
end

end


# FarMar::Vendor
# Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field.
# Market_id - (Fixnum) a reference to which market the vendor attends
