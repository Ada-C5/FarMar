#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    all_products = CSVHasher.hashify('../support/products.csv')
      all_products.collect do |n|
        FarMar::Product.new(n)
      end
  end

  def self.find(id)
    id=id.to_s

    all_products = FarMar::Product.all

    all_products.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

  def self.by_vendor(vendor_id)
    vendor_id = vendor_id.to_s
    all_products = FarMar::Product.all
    all_products.select { |p| p.vendor_id == vendor_id }
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.select { |v| v.id == @vendor_id}
  end

  #sales: returns a collection of FarMar::Sale instances that are
  #associated using the FarMar::Sale product_id field.

  #number_of_sales: returns the number of times this product has been sold.

end
