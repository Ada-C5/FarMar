
# #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
# #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
# #number_of_sales: returns the number of times this product has been sold.
# self.by_vendor(vendor_id): returns all of the products with the given vendor_id

class FarMar::Product

  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    all_products = []
    products = CSV.read('./support/products.csv')
    products.each do |prod|
      all_products << self.new(id: prod[0], name: prod[1], vendor_id: prod[2])
    end
    all_products
  end

  def self.find(find_id)
    self.all.each do |product|
      return product if product.id == find_id.to_s
    end
  end

  def self.by_vendor(find_vendor_id)
    self.all.find_all { |prod| prod.vendor_id == find_vendor_id }
  end

  def vendor
    FarMar::Vendor.all.find { |ven| ven.id == self.vendor_id }
  end

  def sales
    FarMar::Sale.all.find_all { |sale| sale.product_id == id }
  end

  def number_of_sales
    sales.length
  end

end
