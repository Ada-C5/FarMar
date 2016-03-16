require "date"
require 'chronic'
class FarMar::Sale

  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  # self.all: returns a collection of instances, representing all of the objects described in the CSV
  def initialize(sale_info)
    @sale_id = sale_info[:sale_id].to_i
    @amount = sale_info[:amount].to_i
    @purchase_time = Time.parse(sale_info[:purchase_time])
    #@purchase_time = Chronic.parse(sale_info[:purchase_time])
    @vendor_id = sale_info[:vendor_id].to_i
    @product_id = sale_info[:product_id].to_i
  end

  def self.all
    all_sale_info = []
    CSV.open("./support/sales.csv", 'r') do |csv|
      csv.read.each do |line|
        all_sale_info.push(self.new(sale_id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_id: line[4]))
      end
    end
    return all_sale_info
  end

  def self.find(id)
    all_sales = self.all
    all_sales.each do |sale|
      return sale if sale.sale_id == id
    end
    nil
  end

  # vendor: returns the FarMar::Vendor instance that is associated with this sale using the
  # FarMar::Sale vendor_id field
  def vendor
    FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id }
  end

  # product: returns the FarMar::Product instance that is associated with this sale using
  # the FarMar::Sale product_id field
  def product
    FarMar::Product.all.select { |product| product.product_id == product_id }
  end


  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where
  # the purchase time is between the two times given as arguments

  #user should put each time in quotes and can write times however they like
  def self.between(beginning_time, end_time)
    begin_time  = Chronic.parse(beginning_time)
    end_time = Chronic.parse(end_time)
    time_range = (begin_time..end_time)

    all_times = FarMar::Sale.all.select  { |sale | time_range.include? sale.purchase_time }
  #
  #
  #
  #   # map { |item| item.purchase_time }
  #   # all_times.each do |time|
  #   #   Chronic.parse(time)
  #   # end
  #   # between_times = all_times.select! { |time| time_range.include? time }
  #   # return between_times
  #
   end


end







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
