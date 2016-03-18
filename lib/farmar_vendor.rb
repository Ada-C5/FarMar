
class FarMar::Vendor < RepeatMethods
  DATA = "./support/vendors.csv"

  attr_reader :vendor_id, :name, :number_of_employees, :market_id

  def initialize(vendor_info)
    @vendor_id, @name, @number_of_employees, @market_id = vendor_info
    @vendor_id = @vendor_id.to_i
    @number_of_employees = @number_of_employees.to_i
    @market_id = @market_id.to_i
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

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    all_money = sales.collect { |sale| sale.amount}
    all_money.reduce(0, :+)
  end

  #self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    vendors = CSV.read(VENDORS_CSV).select { |line| line[3].to_i == market_id }
    vendors.collect { |vendor| FarMar::Vendor.new(vendor)}
  end

  # self.most_revenue(n) returns the top n vendor instances ranked by total revenue
  # this works but it is breaking my tests because it takes so long

  # def self.most_revenue(n)
  #   self.all.max_by(n) { |vendor| vendor.revenue }
  # end

end
