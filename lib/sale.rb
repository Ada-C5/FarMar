#require 'datetime'
class FarMar::Sale
  FILENAME = "./support/sales.csv"
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_data)
    @id = sale_data[:id].to_i #fixnum
    @amount = sale_data[:amount].to_i #fixnu
    @purchase_time = sale_data[:purchase_time] #datetime
    @vendor_id = sale_data[:vendor_id].to_i # fixnum
    @product_id = sale_data[:product_id].to_i #fixnum
  end

    def self.all # self is the class and all is the method
      sales_collect = []
      CSV.open(FILENAME, "r") do |csv|
      csv.read.each do |line|
        sales_collect << self.new( id: line[0], amount: line[1], purchase_time: line[2], vendor_id: line[3], product_id: line[4] )
      end
      end
      return sales_collect
    end

    def self.find(id)
      all_sales = self.all
      all_sales.each do |sale|
        if sale.id == id
        end
        return sale #an instance
      end
    end


end
