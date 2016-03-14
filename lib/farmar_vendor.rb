require 'csv'
require_relative "../far_mar"

class FarMar::Vendor
#   ID - (Fixnum) uniquely identifies the vendor
# Name - (String) the name of the vendor (not guaranteed unique)
# No. of Employees - (Fixnum) How many employees the vendor has at the market
# Market_id - (Fixnum) a reference to which market the vendor attends
attr_reader :vendor_id, :name, :no_of_employees, :vendor_id

  def initialize(vendor_data)
    # if market_data != nil
      @sale_id         = vendor_data[:vendor_id]
      @amount          = vendor_data[:name]
      @purchase_time   = vendor_data[:no_of_employees]
      @market_id       = vendor_data[:market_id]
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
end
