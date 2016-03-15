#require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :name, :total_employees, :market_id

  def initialize(vendor_info)
    @id               = vendor_info[:id]                # (Fixnum) uniquely identifies the vendor
    @name             = vendor_info[:name]              # (String) the name of the vendor (not guaranteed unique)
    @total_employees  = vendor_info[:total_employees]   # (Fixnum) How many employees the vendor has at the market
    @market_id        = vendor_info[:market_id]         # (Fixnum) a reference to which market the vendor attends
  end

  def self.all
    vendor_csv_file = CSV.read("./support/vendors.csv")
    vendor_csv_file.map {|line| self.new(id: line[0].to_i, name: line[1], total_employees: line[2], market_id: line[3])}
  end

  def self.find(id)
    self.all.select {|vendor| id.to_i == vendor.id}

  end

  # self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    self.all.select {|vendor| market_id.to_i == vendor.market_id.to_i}
  end
 # return a list of market instances (FarMar::Market.id) by matching market_id

  def market
    FarMar::Market.all.select { |market| id.to_i == market.id.to_i}
  end

  # products method - return the FarMar::Product instances that is associated with a particular
  # vendor matching vendor.id and product.vendor_id.
  # The instance of the products that each vendor sells
  def products
    FarMar::Product.all.select { |product| id.to_i == product.vendor_id.to_i }
  end

  def sales
    FarMar::Sale.all.select { |sales| sales.vendor_id.to_i == id.to_i}
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    revenue = sales.map {|sale| sale.amount }
    revenue.reduce(0,:+)
  end

end

# def self.all
#   vendor_list_all = []
#
#   vendor_csv_file = CSV.read("./support/vendors.csv")
#
#   vendor_csv_file.each do |line|
#     vendor_list_all << self.new(id: line[0].to_i, name: line[1], total_employees: line[2], market_id: line[3])
#   end
#   vendor_list_all
# end
