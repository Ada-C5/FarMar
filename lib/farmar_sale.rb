#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

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
    all_sales = CSVHasher.hashify('../support/sales.csv')
      all_sales.collect do |n|
        FarMar::Sale.new(n)
      end
  end

  def self.find(id)
    id=id.to_i

    all_sales = FarMar::Sale.all

    all_sales.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.select { |v| v.id == @vendor_id}
  end

  def product
    all_products = FarMar::Product.all
    all_products.select { |p| p.id == @product_id}
  end

  def self.between(beginning_time, end_time)
    all_sales = FarMar::Sale.all
    all_sales.select { |s| (beginning_time..end_time).cover?(s.purchase_time) }
  end
# beginning_time = DateTime.parse("2013-11-12 06:00:00 -0800")
# end_time = DateTime.parse("2013-11-12 06:05:00 -0800")
end
