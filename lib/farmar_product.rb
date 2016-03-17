require 'csv'
#require_relative "../far_mar"

class FarMar::Product
#   ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product
attr_reader :product_id, :product_name, :vendor_id
attr_accessor

  def initialize(product_info)
    # if market_data != nil
      @product_id       = product_info[:product_id].to_i
      @product_name     = product_info[:product_name]
      @vendor_id        = product_info[:vendor_id].to_i
  end

  def self.all(filename = "./support/products.csv")
    all_products = []
    CSV.open(filename, 'r') do |csv|
      csv.read.each do |line|
      all_products << self.new(product_id: line[0], product_name: line[1], vendor_id: line[2])
      end
    end
    return all_products
  end

  def self.find(product_id, filename = "./support/products.csv")
    CSV.foreach(filename, 'r') do |line|
    #csv.read.each do |line|
      if line[0] == product_id.to_s
        selected_product = self.new(product_id: line[0], product_name: line[1], vendor_id: line[2])
        return selected_product
      end
    end
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this
  #vendor using the FarMar::Product vendor_id field
  def vendor
    FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id }
  end

  #returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  def sales
    FarMar::Sale.all.select { |sale| sale.product_info == product_id }
  end

  #returns the number of times this product has been sold.
  def number_of_sales
    sales.count
  end

  #returns all of the products with the given vendor_id
  def self.by_vendor(vendor_id_given)
    self.all.select { |product| product.vendor_id == vendor_id_given.to_i }
  end
end
