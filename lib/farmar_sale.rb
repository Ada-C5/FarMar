class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sales_hash)
    @id = sales_hash[:id].to_i
    @amount = sales_hash[:amount].to_i
    @purchase_time = DateTime.parse(sales_hash[:purchase_time])
    @vendor_id = sales_hash[:vendor_id].to_i
    @product_id = sales_hash[:product_id].to_i
  end

  def self.all
    CSVHasher.hashify('./support/sales.csv').collect { |n| FarMar::Sale.new(n) }
  end

  def self.find(id)
    FarMar::Sale.all.select { |s| s.id == id }[0]
  end

  def self.between(beginning_time, end_time)
    FarMar::Sale.all.select { |s| (beginning_time..end_time).cover?(s.purchase_time) }
  end

  def vendor
    FarMar::Vendor.all.select { |v| v.id == @vendor_id }[0]
  end

  def product
    FarMar::Product.all.select { |p| p.id == @product_id }[0]
  end

end
