# lib/farmar_vendor.rb
class FarMar::Vendor
  attr_reader :id, :name, :employees, :market_id
  def initialize(hash)
    @id = hash[:id].to_i
    @name = hash[:name]
    @employees = hash[:employees].to_i
    @market_id = hash[:market_id].to_i
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
      info = self.new(id: row[0], name: row[1], employees: row[2],
      market_id: row[3])
      vendors_info << info
    end
    return vendors_info
  end

  def self.find(id)
    self.all.each do |instance|
      if instance.id == id
        return instance
      end
    end
  end

  def market
    FarMar::Market.all.find {|instance| instance.id == market_id}
  end

  def products
    FarMar::Product.all.find_all {|instance| instance.vendor_id == id}
  end

  def sales
    FarMar::Sale.all.find_all {|instance| instance.vendor_id == id}
  end

  def revenue
    amounts = sales.map {|instance| instance.amount}
    amounts.inject(:+)
    # sprintf("%0.02f", amounts.inject(:+))
  end

  def self.by_market(mar_id)
    self.all.find_all {|instance| instance.market_id == mar_id}
  end
end
