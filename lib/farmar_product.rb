class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id].to_i
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id].to_i
  end

  def self.all
    all_products = CSVHasher.hashify('./support/products.csv')
    all_products.collect { |n| FarMar::Product.new(n) }
  end

  def self.find(id)
    all_products = FarMar::Product.all
    found_product = all_products.select { |p| p.id == id }
    found_product[0]
  end

  def self.by_vendor(vendor_id)
    vendor_id = vendor_id.to_i
    all_products = FarMar::Product.all
    all_products.select { |p| p.vendor_id == vendor_id }
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    found_vendor = all_vendors.select { |v| v.id == @vendor_id }
    found_vendor[0]
  end

  def sales
    all_sales = FarMar::Sale.all
    all_sales.select { |s| s.product_id == @id }
  end

  def number_of_sales
    sales.length
  end

end
