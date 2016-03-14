
class FarMar::Vendor

  attr_reader :vendor_id, :vendor_name, :num_of_employees, :market_id

  def initialize(vendor_hash)
    @vendor_id = vendor_hash[:vendor_id]
    @vendor_name = vendor_hash[:vendor_name]
    @num_of_employees = vendor_hash[:num_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    csv_vendors_array = []
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_vendors_array << FarMar::Vendor.new(vendor_id: row[0].to_i, vendor_name: row[1].to_s, num_of_employees: row[2].to_i, market_id: row[3].to_i)
      end
      return csv_vendors_array
    end
  end

  def self.find(id)
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == id
          found_account = FarMar::Vendor.new(vendor_id: row[0].to_i, vendor_name: row[1].to_s, num_of_employees: row[2].to_i, market_id: row[3].to_i)
          return [found_account]
        end
      end
    end
  end
end
