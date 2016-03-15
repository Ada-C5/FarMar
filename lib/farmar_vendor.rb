#get rid of ln2 after done with IRB testing
# require_relative '../far_mar.rb'

class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

def initialize(vendor_hash)
  @id = vendor_hash[:id]
  @name = vendor_hash[:name]
  @employee_num = vendor_hash[:employee_num]
  @market_id = vendor_hash[:market_id]
end

def self.all
  all_vendors = CSVHasher.hashify('./support/vendors.csv')
    all_vendors.collect do |n|
      FarMar::Vendor.new(n)
    end
end

def self.find(id)
  id=id.to_s

  all_vendors = FarMar::Vendor.all

  all_vendors.each do |n|
    if n.id == id
      return n
    end
  end
    return nil
end

end


# FarMar::Vendor
# Each vendor belongs to a market, the market_id field refers to the FarMar::Vendor ID field.
# Market_id - (Fixnum) a reference to which market the vendor attends
