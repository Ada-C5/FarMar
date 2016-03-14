class FarMar::Vendor

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @number_employees = info_hash[:number_employees].to_i
    @market_id = info_hash[:market_id].to_i
  end

end