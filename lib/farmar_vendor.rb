# require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :name, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @number_of_employees = vendor_hash[:number_of_employees]
    @market_id = FarMar::Market.id # this id ain't working...
  end

  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_vendors = CSV.read("./support/vendors.csv")
    # returns a collection of instances, representing all of the objects described in the CSV
    all_vendors.collect do |vendor|

      single_vendor_hash = {
        id: vendor[0],
        name: vendor[1],
        number_of_employees: vendor[2]
      }
      FarMar::Vendor.new(single_vendor_hash)
    end
  end

  def self.find(given_id)

  end
end
