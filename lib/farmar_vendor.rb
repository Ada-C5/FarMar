#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

def initialize(vendor_hash)
  @id = vendor_hash[:id]
  @name = vendor_hash[:name]
  @employee_num = vendor_hash[:employee_num]
  @market_id = vendor_hash[:market_id]
end

def self.all
  all_vendors = CSVHasher.hashify('../support/vendors.csv')
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

def market
  all_markets = FarMar::Market.all
  all_markets.select { |m| m.id == @market_id}
end

# def vendors
#   all_vendors = FarMar::Vendor.all
#   all_vendors.select { |v| @id == v.market_id }
# end

#products: returns a collection of FarMar::Product instances that
#are associated by the FarMar::Product vendor_id field.

def self.by_market(market_id)
  market_id = market_id.to_s
  all_vendors = FarMar::Vendor.all
  all_vendors.select { |v| v.market_id == market_id }
end

#sales: returns a collection of FarMar::Sale instances
#that are associated by the vendor_id field.
#need to do far_mar sale first

#revenue: returns the the sum of
#all of the vendor's sales (in cents)

end
