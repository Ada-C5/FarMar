require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

def initialize(market_hash)
  @id = market_hash[:id]
  @name = market_hash[:name]
  @employee_num = market_hash[:employee_num]
  @market_id = FarMar::Market.id
end

end
