class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

def initialize(market_hash)
  @id = market_hash[:id]
  @amount = market_hash[:amount]
  @purchase_time = market_hash[:purchase_time]
  @vendor_id = FarMar::Vendor.id
  @product_id = FarMar::Product.id
end

end
