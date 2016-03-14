class FarMar::Vendor

  attr_reader :id, :name, :num_of_employees, :market_id

  def initialize(vendor_hash)
    # ID - (Fixnum) uniquely identifies the vendor
    # Name - (String) the name of the vendor (not guaranteed unique)
    # No. of Employees - (Fixnum) How many employees the vendor has at the market
    # Market_id - (Fixnum) a reference to which market the vendor attends

    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_of_employees = vendor_hash[:num_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all(path_to_csv)
    vendor_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
      id = row[0]
      name = row[1]
      num_of_employees = row[2]
      market_id = row[3]

      vendor_hash = {id: id, name: name, num_of_employees: num_of_employees, market_id: market_id}
      vendor_list << self.new(vendor_hash)
    end
    vendor_list
  end

  def self.find(id)
    vendors_to_search = FarMar::Vendor.all("./support/vendors.csv")

    vendors_to_search.each do |vendor|
      if vendor.id == id.to_s
        return vendor
      end
    end
  end

end