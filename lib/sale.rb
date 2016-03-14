class FarMar::Sale

    def initialize(info_hash)
      @id = info_hash[:id].to_i
      @amount = info_hash[:amount].to_i
      @purchase_time = info_hash[:purchase_time]
      @vendor_id = info_hash[:vendor_id].to_i
      @product_id = info_hash[:product_id].to_i
    end

end