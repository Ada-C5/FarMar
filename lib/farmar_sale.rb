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
      @sale_id         = sale_data[:sale_id].to_i
      @amount          = sale_data[:amount].to_i
      @purchase_time   = sale_data[:purchase_time]
      @vendor_id       = sale_data[:vendor_id].to_i
      @product_info    = sale_data[:product_info].to_i
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

  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  def vendor
    FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id }
  end

  #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
  def product
    FarMar::Product.all.select { |product| product.product_id == product_info }
  end

  #returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
  def self.between(begin_date, end_date)
    sales_array =[]
    self.all.each do |sale|
      purchase_time = DateTime.parse(sale.purchase_time)
      if (purchase_time > begin_date) && (purchase_time < end_date)
        sales_array << sale
      end
    end
    return sales_array
  end
end
