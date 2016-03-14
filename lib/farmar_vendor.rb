# lib/farmar_vendor.rb
class FarMar::Vendor
  attr_reader :id, :name, :employees, :market_id
  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @employees = hash[:employees]
    @market_id = hash[:market_id]
    # @vendors = CSV.read('../support/vendors.csv')
  end

  # ID - (Fixnum) uniquely identifies the vendor
  # Name - (String) the name of the vendor (not guaranteed unique)
  # No. of Employees - (Fixnum) How many employees the vendor has at the market
  # Market_id - (Fixnum) a reference to which market the vendor attends

  # creates instances (500) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    vendors_info = []
    CSV.foreach("support/vendors.csv") do |row|
      info = self.new(id: row[0].to_i, name: row[1], employees: row[2].to_i,
      market_id: row[3].to_i)
      vendors_info << info
    end
    return vendors_info
  end

  def self.find(id)
    self.all.each do |instance|
      if instance.id == id.to_i
        return instance
      end
    end
  end

  def market
    FarMar::Market.all.find {|instance| instance.id == market_id}
    # OLD METHOD below
    # mar = FarMar::Market.all
    # matched_info = []
    # mar.each do |market|
    #   if market.id == market_id
    #     return market
    #     matched_info << market
    #   end
    # end
    # return matched_info
  end
end
