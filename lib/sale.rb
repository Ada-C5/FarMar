class FarMar::Sale
  attr_reader :id, :amount

  extend FarMar::FarMarMethods

    def initialize(info_hash)
      @id = info_hash[:id].to_i
      @amount = info_hash[:amount].to_i
      @purchase_time = info_hash[:purchase_time]
      @vendor_id = info_hash[:vendor_id].to_i
      @product_id = info_hash[:product_id].to_i
    end

    def self.all(file = './support/sales.csv')
      sale_keys = [:id, :amount, :purchase_time, :vendor_id, :product_id]

      make_all(file, sale_keys)
    end
end