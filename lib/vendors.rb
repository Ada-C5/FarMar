class FarMar::Vendor
  attr_accessor :vendor_id, :vendor_name, :num_employees, :market_id

  def initialize(id, name, employees, market_id)
    @vendor_id = id
    @vendor_name = name
    @num_employees = employees
    @market_id = market_id
  end

  def self.all
    csv_array = CSV.read('support/vendors.csv')
    @all_vendors = csv_array.collect do |row|
      self.new(row[0].to_i,row[1],row[2],row[3].to_i)
    end
  end

  def self.find(id)
    FarMar::Vendor.all
    @all_vendors.each do |vendor|
      if vendor.vendor_id == id.to_i
        return vendor
      end
    end
  end
end
