#require_relative '../far_mar'
require 'date'
require 'chronic'

class FarMar::Sale

  CSV_FILE = "./support/sales.csv"

  @@sale = nil

  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id


  def initialize(sales_info)
    @id, @amount, @purchase_time, @vendor_id, @product_id = sales_info

    # converting instance variables to correct format
    @id             = @id.to_i
    @amount         = @amount.to_i
    @purchase_time  = Time.parse(@purchase_time)
    @vendor_id      = @vendor_id.to_i
    @product_id     = @product_id.to_i

    # sales_info
    # @id             = sale_info[ :id ]            # ((Fixnum) uniquely identifies the product
    # @amount         = sale_info[ :amount ]        # (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
    # @purchase_time  = Time.parse(sale_info[:purchase_time]) # (Datetime) when the sale was completed
    # @vendor_id      = sale_info[ :vendor_id ]     # (Fixnum) a reference to which vendor completed the sale
    # @product_id     = sale_info[ :product_id ]     # (Fixnum) a reference to which product was sold
  end

  def self.all(file = CSV_FILE)
    @@sale ||= begin
      sale_csv_info = CSV.read(file)
      sale_csv_info.map {|line| self.new(line)}
    end
  end

  def self.find(id)
    self.all.find { |sale| sale.id == id.to_i } #since it returns an array and I want the instance
  end

  def self.between(beginning_time, end_time)

    start_date = Chronic.parse(beginning_time)
    end_date   = Chronic.parse(end_time)

    result = self.all.select {|sale| (start_date..end_date).cover? (sale.purchase_time) }
  end

  def self.vendor_with_highest_revenue_in (beginning_time, end_time)
    start_date = Chronic.parse(beginning_time)
    end_date   = Chronic.parse(end_time)

    date_range = (start_date..end_date)

    return "Please try again" if start_date >= end_date

    select_sales = self.all.select {|sale| (date_range).cover? (sale.purchase_time) }

    select_sales_by_vendor = {}

    select_sales.each do |sale|
      amount = sale.amount
      vendor = sale.vendor_id

      if select_sales_by_vendor [vendor].nil?
        select_sales_by_vendor[vendor] = amount
      else
        select_sales_by_vendor[vendor] += amount
      end
    end

    select_sales_by_vendor.max_by {|vendor, amount| amount}

  end

  # returns all the instances of vendor that match the sale instance
  def vendor
    FarMar::Vendor.all.select {|vendor| vendor.id == vendor_id}
  end

  def product
    FarMar::Product.all.select { |product| product.id == product_id}
  end

end

# def min_max
#   self.all.minmax_by {|date| date.purchase_time}
# end
#
# def self.date
#   self.all.map {|date| date.purchase_time.date}
# end
#
#
# def self.between_hour(beginning_time, end_time)
#   start_date = Chronic.parse(beginning_time).hour
#   end_date   = Chronic.parse(end_time).hour
#   result = self.all.select {|sale| (start_date..end_date).cover? (sale.purchase_time).hour }
#   return result
# end

#
# def highest_vendor_by_date_in (beginning_time, end_time)     # 5 - 7
#   start_date = Chronic.parse(beginning_time)
#   end_date   = Chronic.parse(end_time)
#
#   date_range = (start_hour..end_hour)
#
#   return "Please try again" if start_hour >= end_hour
#
#   select_sales = self.all.select {|sale| (date_range).cover? (sale.purchase_time) }
#
#   select_sales.each do |sale| # 10-11-2016 5pm, $300, "Joe"
#     sale_hour = sale.purchase_time.hour
#     amount = sale.amount
#     vendor = sale.vendor_id
#
#     select_sales_by_vendor = {}
#
#     #key = vendor_name
#
#     if select_sales_by_vendor [vendor].nil?
#       select_sales_by_vendor[vendor] = amount
#     else
#       select_sales_by_vendor[vendor] += amount
#     end
#   end
#
#   select_sales_by_vendor.max_by {|vendor, amount| amount}
# end
