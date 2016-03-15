class FarMar::Vendor

  attr_reader :vendor_id, :name, :number_of_employees, :market_id
  # self.all: returns a collection of instances, representing all of the objects described in the CSV
  def initialize(vendor_info)
    @vendor_id = vendor_info[:vendor_id].to_i
    @name = vendor_info[:name]
    @number_of_employees = vendor_info[:number_of_employees].to_i
    @market_id = vendor_info[:market_id].to_i
  end

  def self.all
    all_vendor_info = []
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |line|
        all_vendor_info.push(self.new(vendor_id: line[0], name: line[1], number_of_employees: line[2], market_id: line[3]))
      end
    end
    return all_vendor_info
  end

  def self.find(id)
    all_vendors = self.all
    all_vendors.each do |vendor|
      return vendor if vendor.vendor_id == id
    end
    nil
  end

  #market: returns the FarMar::Market instance that is associated with this vendor using
  #the FarMar::Vendor market_id field

  def market
    FarMar::Market.all.select { |market| market.market_id == market_id }
  end


end


#products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
#sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
#revenue: returns the the sum of all of the vendor's sales (in cents)
#self.by_market(market_id): returns all of the vendors with the given market_id



# Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field.
# Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:


# 1. ID - (Fixnum) uniquely identifies the vendor
# 2. Name - (String) the name of the vendor (not guaranteed unique)
# 3. No. of Employees - (Fixnum) How many employees the vendor has at the market
# 4. Market_id - (Fixnum) a reference to which market the vendor attends
