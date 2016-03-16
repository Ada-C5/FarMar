# require_relative '../far_mar'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_products = CSV.read("./support/products.csv")
    # returns an array of instances with attributes created from a hash, representing all of the objects described in the CSV
    all_products.collect do |product|

      single_product_hash = {
        id: product[0].to_i,
        name: product[1],
        vendor_id: product[2].to_i
      }
      FarMar::Product.new(single_product_hash)
    end
  end

  def self.find(given_id)
    # this can actually be refactored to a .find enumerator later
    found_product = nil
    self.all.each do |product|
      if product.id == given_id
        found_product = product
      end
    end
    found_product
  end

  def self.by_vendor(vendor_id)
    # returns all of the products with the given vendor_id
    self.all.find_all {|product| product.vendor_id == vendor_id }
  end

  def vendor
    # returns the FarMar::Vendor instance that is associated with this vendor
    # using the FarMar::Product vendor_id field
    FarMar::Vendor.all.find {|vendor| vendor.id == vendor_id}
  end

  def sales
    # returns a collection of FarMar::Sale instances that are associated
    # using the FarMar::Sale product_id field.
    FarMar::Sale.all.find_all {|sale| sale.product_id == id}
  end

  def number_of_sales
    # returns the number of times this product has been sold
    sales.length
  end
end
