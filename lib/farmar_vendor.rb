
class FarMar::Vendor
  attr_reader :market_id, :name, :vendor_id, :employees
  def initialize(market_hash) #for all, csv length -1?
    @vendor_id = market_hash[:vid],
    @name = market_hash[:name],
    @market_id = market_hash[:mid],
    @employees = market_hash[:employees]
  end

  def read_csv
    CSV.open('../support/vendors.csv')
  end

  def self.all
    vendor_instances = []
    self.pull_from_csv.each do |vendor|
      vendor_info = {
        vid: vendor[0],
        name: vendor[1],
        employees: vendor[2],
        mid: vendor[3]
      }
      new_vendor = FarMar::Vendor.new(vendor_info)
      vendor_instances << new_vendor
    end
      vendor_instances
  end
end
