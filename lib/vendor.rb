#require_relative '../far_mar'

class FarMar::Vendor

  CSV_FILE = "./support/vendors.csv"

  @@vendors = nil

  attr_reader :id, :name, :total_employees, :market_id

  def initialize(vendor_info)
    @id, @name, @total_employees, @market_id = vendor_info
    @id = @id.to_i
    @market_id = @market_id.to_i

    #vendor_info
    # @id               = vendor_info[:id]                # (Fixnum) uniquely identifies the vendor
    # @name             = vendor_info[:name]              # (String) the name of the vendor (not guaranteed unique)
    # @total_employees  = vendor_info[:total_employees]   # (Fixnum) How many employees the vendor has at the market
    # @market_id        = vendor_info[:market_id]         # (Fixnum) a reference to which market the vendor attends
  end

  def self.all
    @@vendors ||= begin
      vendor_csv_file = CSV.read(CSV_FILE)
      vendor_csv_file.map {|line| self.new(line)
    end
  end

  def self.find(id)
    self.all.find {|vendor| vendor.id == id}.first
  end

  # self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    self.all.select {|vendor| == vendor.market_id == market_id }
  end
 # return a list of market instances (FarMar::Market.id) by matching market_id

  def market
    FarMar::Market.all.select { |market| market.id == id}
  end

  # products method - return the FarMar::Product instances that is associated with a particular
  # vendor matching vendor.id and product.vendor_id.
  # The instance of the products that each vendor sells
  def products
    FarMar::Product.all.select { |product| product.vendor_id == id  }
  end

  def sales
    FarMar::Sale.all.select { |sales| sales.vendor_id == id}
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    sales_by_vendor = sales.map {|sale| sale.amount }
    sales_by_vendor.reduce(0,:+)
  end

  def self.most_revenue(n)
    self.all.max_by(n) {|vendor| vendor.revenue}
  end

  def sales_by_vendor
    revenue = sales.map {|sale| sale.amount }
  end

  def self.most_items(n)
    self.all.max_by(n) {|vendor| vendor.products.count}
  end

end
