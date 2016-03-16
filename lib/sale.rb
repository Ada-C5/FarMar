#require_relative '../far_mar'
require 'date'
require 'chronic'

class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  FILE = "./support/sales.csv"
  def initialize(sale_info)
    @id             = sale_info[ :id ]            # ((Fixnum) uniquely identifies the product
    @amount         = sale_info[ :amount ]        # (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
    @purchase_time  = Time.parse(sale_info[:purchase_time]) # (Datetime) when the sale was completed
    @vendor_id      = sale_info[ :vendor_id ]     # (Fixnum) a reference to which vendor completed the sale
    @product_id     = sale_info[ :product_id ]     # (Fixnum) a reference to which product was sold
  end

  def self.all
    sale_csv_info = CSV.read(FILE)
    sale_csv_info.map {|line| self.new(id: line[0].to_i, amount: line[1].to_i, purchase_time: line[2], vendor_id: line[3], product_id: line[4] )}
  end

  def self.find(id)
    self.all.select { |sale| id.to_i == sale.id.to_i }[0]
  end

  # returns all the instances of vendor that match the sale instance
  #using FarMar::Sale.vendor_id == FarMar::Vendor.id

  def vendor
    FarMar::Vendor.all.select {|vendor| vendor.id.to_i == vendor_id.to_i}
  end

  def product
    FarMar::Product.all.select { |product| product.id.to_i == product_id.to_i}
  end

  def self.between(beginning_time, end_time)
    start_date = Chronic.parse(beginning_time)
    end_date   = Chronic.parse(end_time)
    result = self.all.select {|sale| (start_date..end_date).cover? (sale.purchase_time) }
    return result
  end

  # def min_max
  #   self.all.minmax_by {|date| date.purchase_time}
  # end
end
