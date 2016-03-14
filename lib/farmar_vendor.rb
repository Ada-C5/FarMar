
class FarMar::Vendor
  attr_reader :market_id, :name, :vendor_id, :employees
  def initialize(vendor_hash) #for all, csv length -1?
    @vendor_id = vendor_hash[:vid],
    @name = vendor_hash[:name],
    @market_id = vendor_hash[:mid],
    @employees = vendor_hash[:employees]
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
