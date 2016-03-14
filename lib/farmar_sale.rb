# require_relative '../far_mar'

class FarMar::Sale
  attr_reader :id, :name, :vendor_id

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = FarMar::Vendor.id
    @product_id = FarMar::Product.id
  end
end
