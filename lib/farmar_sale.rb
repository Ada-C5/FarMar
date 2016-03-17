require "date"
require 'chronic'
class FarMar::Sale

  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_info)
    @sale_id, @amount, @purchase_time, @vendor_id, @product_id = sale_info
    @sale_id = @sale_id.to_i
    @amount = @amount.to_i
    @purchase_time = Chronic.parse(@purchase_time)
    @vendor_id = @vendor_id.to_i
    @product_id = @product_id.to_i
  end

  # self.all: returns a collection of instances, representing all of the objects described in the CSV
  def self.all
    CSV.read(SALE_CSV).map { |line| self.new(line) }
  end

  def self.find(id)
    CSV.foreach(SALE_CSV) do |line|
      return self.new(line) if line[0].to_i == id
    end
  end

  # vendor: returns the FarMar::Vendor instance that is associated with this sale using the
  # FarMar::Sale vendor_id field
  def vendor
    CSV.foreach(VENDORS_CSV) do |line|
      return FarMar::Vendor.new(line) if line[0].to_i == self.vendor_id
    end
  end

  # product: returns the FarMar::Product instance that is associated with this sale using
  # the FarMar::Sale product_id field
  def product
    CSV.foreach(PRODUCT_CSV) do |line|
      return FarMar::Product.new(line) if line[0].to_i == self.product_id
    end
  end

  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where
  # the purchase time is between the two times given as arguments
  #user should put each time in quotes and can write times however they like
  def self.between(beginning_time, end_time)
    begin_time = Chronic.parse(beginning_time)
    end_time = Chronic.parse(end_time)
    time_range = (begin_time..end_time)
    sales = CSV.read(SALE_CSV).select do |line|
      time_range.include? Chronic.parse(line[2])
    end
    sales.collect { |sale| FarMar::Sale.new(sale)}
  end
end

# def products
#   products = CSV.read(PRODUCT_CSV).select do |line|
#     line[2].to_i == self.vendor_id
#   end
#   products.collect { |product| FarMar::Product.new(product)}
# end
#
# FarMar::Sale.all.select  { |sale | time_range.include? sale.purchase_time }


# time = DateTime.parse('2013-11-12 12:00:35')
#can do time.month, time.day time.year

# Each sale belongs to a vendor AND a product. The vendor_id and product_id fields refer to
# the FarMar::Vendor and FarMar::Product ID fields, respectively. The FarMar::Sale data, in
# order in the CSV, consists of:
#
# 1.  ID - (Fixnum) uniquely identifies the product
# 2.  Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# 3.  Purchase_time - (Datetime) when the sale was completed
# 4.  Vendor_id - (Fixnum) a reference to which vendor completed the sale
# 5.  Product_id - (Fixnum) a reference to which product was sold

# def vendor
#   FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id }
# end
