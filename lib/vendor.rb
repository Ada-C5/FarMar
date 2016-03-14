class FarMar::Vendor
  attr_reader :id, :name, :num_employees, :market_id

  VENDOR_FILE = "support/vendors.csv"

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_employees = vendor_hash[:num_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    vendors = []
    CSV.foreach(VENDOR_FILE) do |row|
      vendors << FarMar::Vendor.new(id: row[0].to_i, name: row[1], num_employees: row[2].to_i,
        market_id: row[3].to_i)
    end
    return vendors

  end

  def self.find(id)
    vendors = self.all
    found_id = nil
    vendors.each do |vendor|
      if vendor.id == id
        found_id = vendor
      end
    end
    if found_id == nil
      return "ID not found!"
    else
      return found_id
    end
  end

end
