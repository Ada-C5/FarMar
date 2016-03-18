class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id].to_i
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id].to_i
  end

  def self.all
    CSVHasher.hashify('./support/products.csv').collect { |n| FarMar::Product.new(n) }
  end

  def self.find(id)
    FarMar::Product.all.select { |p| p.id == id }[0]
  end

  def self.by_vendor(vendor_id)
    FarMar::Product.all.select { |p| p.vendor_id == vendor_id }
  end

  def vendor
    FarMar::Vendor.all.select { |v| v.id == @vendor_id }[0]
  end

  def sales
    FarMar::Sale.all.select { |s| s.product_id == @id }
  end

  def number_of_sales
    sales.length
  end

end
