class FarMar::Vendor
  VENDORS_CSV = "./support/vendors.csv"

  attr_reader :vendor_id, :name, :number_of_employees, :market_id
  # self.all: returns a collection of instances, representing all of the objects described in the CSV

  def initialize(vendor_info)
    @vendor_id, @name, @number_of_employees, @market_id = vendor_info
    @vendor_id = @vendor_id.to_i
    @number_of_employees = @number_of_employees.to_i
    @market_id = @market_id.to_i
  end

  def self.all
    CSV.read(VENDORS_CSV).map do |line|
      self.new(line)
    end
  end

  def self.find(id, file =  VENDORS_CSV)
    CSV.foreach(file) do |line|
      return self.new(line) if line[0].to_i == id
    end
  end

  #market: returns the FarMar::Market instance that is associated with this vendor using
  #the FarMar::Vendor market_id field
  def market
    CSV.foreach(MARKET_CSV) do |line|
      return FarMar::Market.new(line) if line[0].to_i == self.market_id
    end
  end

  #products: returns a collection of FarMar::Product instances that are associated by
  #the FarMar::Product vendor_id field.

  def products
    products = CSV.read(PRODUCT_CSV).select do |line|
      line[2].to_i == self.vendor_id
    end
    products.collect { |product| FarMar::Product.new(product)}
  end

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def sales
    sales = CSV.read(SALE_CSV).select do  |line|
      line[3].to_i == vendor_id
    end
    sales.collect { |sale| FarMar::Sale.new(sale)}
  end
  # def sales
  #   FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id}
  # end

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    all_money = sales.collect { |sale| sale.amount}
    all_money.reduce(0, :+)
  end

  #self.by_market(market_id): returns all of the vendors with the given market_id

  def self.by_market(market_id)
    CSV.foreach(VENDORS_CSV) do |line|
      return FarMar::Vendor.new(line) if line[3] == market_id
    end
  end

  def self.by_market(market_id)
    vendors = CSV.read(VENDORS_CSV).select { |line| line[3].to_i == market_id }
    vendors.collect { |vendor| FarMar::Vendor.new(vendor)}
  end


end


# Each vendor belongs to a market, the market_id field refers to the FarMar::Market ID field.
# Each vendor has many products for sell. The FarMar::Vendor data, in order in the CSV, consists of:


# 1. ID - (Fixnum) uniquely identifies the vendor
# 2. Name - (String) the name of the vendor (not guaranteed unique)
# 3. No. of Employees - (Fixnum) How many employees the vendor has at the market
# 4. Market_id - (Fixnum) a reference to which market the vendor attends


# def initialize(vendor_info)
#   @vendor_id = vendor_info[:vendor_id].to_i
#   @name = vendor_info[:name]
#   @number_of_employees = vendor_info[:number_of_employees].to_i
#   @market_id = vendor_info[:market_id].to_i
# end


# def self.all
#   all_vendor_info = []
#   CSV.open("./support/vendors.csv", 'r') do |csv|
#     csv.read.each do |line|
#       all_vendor_info.push(self.new(line))
#     end
#   end
#   return all_vendor_info
# end

# def self.find_first_version(id)
#   all_vendors = self.all
#   all_vendors.each do |vendor|
#     return vendor if vendor.vendor_id == id
#   end
#   nil
# end


# def products
#   FarMar::Product.all.select { |product| product.vendor_id == vendor_id}
# end


# def market
#   FarMar::Market.all.select { |market| market.market_id == market_id }
# end


# def self.by_market(market_id)
#   FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id}
# end
