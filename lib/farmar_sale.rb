require 'csv'
require_relative "../far_mar"
require 'date'

class FarMar::Sale
#   ID - (Fixnum) uniquely identifies the sale
# Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
# Purchase_time - (Datetime) when the sale was completed
# Vendor_id - (Fixnum) a reference to which vendor completed the sale
# Product_id - (Fixnum) a reference to which product was sold
attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_info

  def initialize(sale_data)
    # if market_data != nil
      @sale_id         = sale_data[:sale_id]
      @amount          = sale_data[:amount]
      @purchase_time   = sale_data[:purchase_time]
      @vendor_id       = sale_data[:vendor_id]
      @product_info    = sale_data[:product_info]
  end

  def self.all(filename = "./support/sales.csv")
    all_sales = []
    CSV.open(filename, 'r') do |csv|
      csv.read.each do |line|
      all_sales << self.new(sale_id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_info: line[4])
      end
    end
    return all_sales
  end

  def self.find(sale_id, filename = "./support/sales.csv")
    CSV.foreach(filename, 'r') do |line|
    #csv.read.each do |line|
        if line[0] == sale_id.to_s
          selected_sale = self.new(sale_id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_info: line[4])
          return selected_sale
        end
      end
  end
end
