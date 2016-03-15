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
    vendor_list_all = []

    vendor_csv_file = CSV.read("./support/vendors.csv")

    vendor_csv_file.each do |line|
      vendor_list_all << self.new(id: line[0].to_i, name: line[1], total_employees: line[2], market_id: line[3])
    end
    vendor_list_all
  end

  def self.find(id)
    vendor_list_all = self.all

    vendor_list_all.each do |vendor|
      if id.to_i == vendor.id
        return vendor
      end
    end
  end

  # self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    vendors = self.all

    vendor_list = []

    vendors.each do |vendor|
      vendor_list << vendor if market_id.to_i == vendor.market_id.to_i
    end
    vendor_list
  end
 # return a list of market instances (FarMar::Market.id) by matching market_id
  def market
    market_list_all = FarMar::Market.all

    matching_market_list = []

    market_list_all.each do |market|
      matching_market_list << market if market.id == market_id
    end
    return matching_market_list
  end

  # products method - return the FarMar::Product instances that is associated with a particular
  # vendor matching vendor.id and product.vendor_id.
  # The instance of the products that each vendor sells
  def products
    products_list_all = FarMar::Product.all

    matching_products_list = []

    products_list_all.each do |product|
      matching_products_list << product if id.to_i == product.vendor_id.to_i
    end
    return matching_products_list
  end

  def sales
    sales_list_all = FarMar::Sale.all

    matching_sales_list = []

    sales_list_all.each do |sales|
      matching_sales_list << sales if sales.vendor_id.to_i == id.to_i
    end
    return matching_sales_list
  end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    # access all the sales for the vendor. Revenue = sum the total number of sales
    # revenue = sales.amount.reduce(0,:+)
    revenue = sales.map {|sale| sale.amount }
    revenue.reduce(0,:+)
  end

end
