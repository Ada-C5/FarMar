require_relative '../farmar'

class FarMar::Vendor
  def initialize(vendor_id, vendor_name, employees, market_id)
    @vendor_id = vendor_id
    @vendor_name = vendor_name
    @employees = employees
    @market_id = market_id
  end

  def self.all
      require "CSV"
      all_vendors = CSV.read("./support/vendors.csv", "r")

      all_vendors.each do |individual_array|
        @vendor_id    = individual_array[0].to_f
        @vendor_name  = individual_array[1].to_s  #does this need to be a to_s?
        @employees    = individual_array[2]
        @market_id    = individual_array[3]
      end
    end

  def self.find(id)
    require "CSV"
    all_vendors = CSV.read("./support/vendors.csv", "r")

    all_vendors.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        puts "Vendor ID:    #{individual_array[0]}"
        puts "Vendor Name:  #{individual_array[1]}"
        puts "Employees:    #{individual_array[2]}"
        puts "Market ID:    #{individual_array[3]}"
      end
    end
  end

end #class end
