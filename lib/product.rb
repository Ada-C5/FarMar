class FarMar::Product
  attr_reader :product_id, :name, :vendor_id

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/products.csv"
  PRODUCT_CSV = FarMar::Product.read_csv(FILE)

  def initialize(product_id)
    product_id -= 1
    @product_id = PRODUCT_CSV[product_id][0].to_i
    @name = PRODUCT_CSV[product_id][1]
    @vendor_id = PRODUCT_CSV[product_id][2].to_i
  end

  def self.all
    allproducts = []
    PRODUCT_CSV.length.times do |index|
      allproducts << FarMar::Product.new(index)
    end
    return allproducts
  end

  def self.find(product_id)
    return FarMar::Product.new(product_id)
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this product using the FarMar::Product vendor_id field
  def self.find_by_vendor(vendor_id)
    products = PRODUCT_CSV.find_all { |product| product.last.to_i == vendor_id }
    return FarMar::Vendor.new(products.last.last)
  end
end
