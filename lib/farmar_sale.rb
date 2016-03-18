#get rid of ln2 after done with IRB testing
# require_relative '../far_mar.rb'

class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sales_hash)
    @id = sales_hash[:id].to_i
    @amount = sales_hash[:amount].to_i
    @purchase_time = DateTime.parse(sales_hash[:purchase_time])
    @vendor_id = sales_hash[:vendor_id].to_i
    @product_id = sales_hash[:product_id].to_i
  end

  def self.all
    all_sales = CSVHasher.hashify('./support/sales.csv')
    all_sales.collect { |n| FarMar::Sale.new(n) }
  end

  def self.find(id)
    all_sales = FarMar::Sale.all
    found_sale = all_sales.select { |s| s.id == id }
    found_sale[0]
  end

  def self.between(beginning_time, end_time)
    all_sales = FarMar::Sale.all
    all_sales.select { |s| (beginning_time..end_time).cover?(s.purchase_time) }
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    found_vendor = all_vendors.select { |v| v.id == @vendor_id }
    found_vendor[0]
  end

  def product
    all_products = FarMar::Product.all
    found_product = all_products.select { |p| p.id == @product_id }
    found_product[0]
  end

end
