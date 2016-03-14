require 'csv'
require_relative "../far_mar"

class FarMar::Product
#   ID - (Fixnum) uniquely identifies the product
# Name - (String) the name of the product (not guaranteed unique)
# Vendor_id - (Fixnum) a reference to which vendor sells this product
attr_reader :product_id, :product_name, :vendor_id
attr_accessor

  def initialize(product_info)
    # if market_data != nil
      @product_id       = product_info[:product_id]
      @product_name     = product_info[:product_name]
      @vendor_id        = product_info[:vendor_id]
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
end
