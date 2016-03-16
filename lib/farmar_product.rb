#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id].to_i
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id].to_i
  end

  def self.all
    all_products = CSVHasher.hashify('../support/products.csv')
      all_products.collect do |n|
        FarMar::Product.new(n)
      end
  end

  def self.find(id)
    id=id.to_i

    all_products = FarMar::Product.all

    all_products.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

  def self.by_vendor(vendor_id)
    vendor_id = vendor_id.to_i
    all_products = FarMar::Product.all
    all_products.select { |p| p.vendor_id == vendor_id }
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.select { |v| v.id == @vendor_id}
  end

  def sales
    all_sales = FarMar::Sale.all
    all_sales.select { |s| s.product_id == @id}
  end

  def number_of_sales
    sales.length
  end

end
