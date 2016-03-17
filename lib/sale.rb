#require_relative './far_mar' if i want to run it in IRB
require 'CSV'
class FarMar::Sale
  include FarMar
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(id=nil,amount=nil,purchase_time=nil,vendor_id=nil,product_id=nil)
    @id = id.to_s
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id.to_i
    @product_id = product_id.to_i
  end


  def self.all
      sales = []
      CSV.read("./support/sales.csv").each do |line|
      sales << self.new(line[0],line[1],line[2],line[3],line[4])
    end
    return sales #just as a reminder out side of loop
  end

  def self.find(id)
    CSV.read("./support/sales.csv").each do |line|
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2],line[3],line[4])
        end
      end
  end


  def vendor
    vendor_list = []
    CSV.read("./support/vendors.csv").each do |line|
        if line[0].to_i == vendor_id.to_i
        vendor_list << FarMar::Vendor.new(line[0],line[1],line[3])
        end
      end
      return vendor_list
  end


  def product
    product_list = []
    CSV.read("./support/products.csv").each do |line|
      if line[0].to_i == product_id.to_i
      product_list << FarMar::Product.new(line[0],line[1],line[2])
      end
    end
    return product_list
  end

  def self.between(beginning_time,end_time)
     beginning_time = Date.parse(beginning_time)
     end_time = Date.parse(end_time)
    times_range = []
    CSV.read("./support/sales.csv").each do |line|
      if ((beginning_time..end_time).cover? Date.parse(line[2]))
        times_range << FarMar::Sale.new(line[0],line[1],line[3])
      end
    end
    return times_range
  end

end
