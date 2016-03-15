
class FarMar::Product

  attr_reader :id, :name, :vendor_id

  PRODUCT_FILE = "support/products.csv"

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    products = []
    CSV.foreach(PRODUCT_FILE) do |row|
      products << FarMar::Product.new(id: row[0].to_i, name: row[1], vendor_id: row[2].to_i)
    end
    return products

  end

  def self.find(id)
    self.all.find { |product| product.id == id }
  end

  def vendor(vendor_id)
    FarMar::Vendor.all.find { |vendor| vendor.id == vendor_id }
  end
end
