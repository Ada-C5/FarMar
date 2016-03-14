class FarMar::Product

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @vendor_id = info_hash[:vendor_id].to_i
  end

end