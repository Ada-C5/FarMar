#require_relative '../far_mar'
require 'CSV'
class FarMar::Product
  include FarMar
attr_reader :id, :name, :vendor, :vendor_id
  def initialize(id=nil,name=nil,vendor_id=nil,product_id=nil)
    @id = id.to_i
    @name = name.to_s
    @vendor_id = vendor_id.to_i
    @product_id = product_id.to_i
  end

  def self.all
      products = []
      CSV.read("./support/products.csv").each do |line| #remember to take off dot when using rake
      products << self.new(line[0],line[1],line[2])
    end
    return products #just as a reminder out side of loop
  end

  def self.find(id)
    CSV.read("./support/products.csv").each do |line| #remember to take off dot when using rake
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2])
        end
      end
  end

  def vendor
        vendor_list = []
        CSV.read("./support/vendors.csv").each do |line|
          if line[0] == vendor_id.to_s
            vendor_list<< FarMar::Vendor.new(line[0],line[1],line[2],line[3])
          end
      end
      return vendor_list #just as a reminder out side of loop
  end


  def sales
    sales_list = []
    CSV.read("./support/sales.csv").each do |line|
      if line[4] == id.to_s
      sales_list << FarMar::Sale.new(line[0],line[1],line[3],line[4])
      end
    end
    return sales_list

  end

  def number_of_sales
    sales.length
  end

  def self.by_vendor(vendor_id)
    vendor_id_list = []
    CSV.read("./support/products.csv").each do |line|
      if line[2] == vendor_id.to_s
      vendor_id_list << FarMar::Product.new(line[0],line[1],line[2])
      end
    end
    vendor_id_list
  end

end
