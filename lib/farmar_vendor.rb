require 'csv'
require_relative "../far_mar"

class FarMar::Vendor
#   ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
attr_reader :vendor_id, :name, :no_of_employees
attr_accessor :market_id

  def initialize(vendor_data)
    # if market_data != nil
      @vendor_id       = vendor_data[:vendor_id].to_i
      @name             = vendor_data[:name]
      @no_of_employees  = vendor_data[:no_of_employees].to_i
      @market_id       = vendor_data[:market_id].to_i
  end

  def self.all(filename = "./support/vendors.csv")
    all_vendors = []
    CSV.open(filename, 'r') do |csv|
      csv.read.each do |line|
      all_vendors << self.new(vendor_id: line[0], name: line[1], no_of_employees: line[2], market_id: line[3])
      end
    end
    return all_vendors
  end

  def self.find(vendor_id, filename = "./support/vendors.csv")
    CSV.foreach(filename, 'r') do |line|
    #csv.read.each do |line|
        if line[0] == vendor_id.to_s
          selected_vendor = self.new(vendor_id: line[0], name: line[1], no_of_employees: line[2], market_id: line[3])
          return selected_vendor
        end
    end
  end

  #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  def market
    FarMar::Market.all.select { |market| market.id == market_id }
  end

  #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  def products
    FarMar::Product.all.select { |product| product.vendor_id == vendor_id }
  end

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def sales
    FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id }
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    sales.map { |sale| sale.amount }.reduce(0, :+)
  end

  #self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id_given)
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id_given.to_i }
  end

end
