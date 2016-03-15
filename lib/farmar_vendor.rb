
class FarMar::Vendor
  attr_reader :market_id, :name, :vendor_id, :employees
  def initialize(line)
    @vendor_id = line[0].to_i
    @name = line[1]
    @employees = line[2].to_i
    @market_id = line[3].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/vendors.csv')
  end

  def self.all
    all_vendors = {}
    self.pull_from_csv.each do |vendor_instance|
        all_vendors[vendor_instance[0]] = FarMar::Vendor.new(vendor_instance)
      end
    return all_vendors
  end

  def self.find(id) #find by vendor id
    pull_from_csv.each do |vendor_instance|
      if vendor_instance[0].to_i == id.to_i
        return FarMar::Vendor.new(vendor_instance)
      end
    end
    return "no instance found"
  end
end
