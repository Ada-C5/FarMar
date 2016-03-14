require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :name, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @number_of_employees = vendor_hash[:number_of_employees]
    @market_id = FarMar::Market.id
  end
end
