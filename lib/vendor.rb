class FarMar::Vendor

  attr_reader :id, :name, :market_id, :num_employees

  def initialize(vendor_hash)
    @id            = vendor_hash[:id]
    @name          = vendor_hash[:name]
    @num_employees = vendor_hash[:num_employees]
    @market_id     = vendor_hash[:market_id]
  end

  def self.all
    all_vendors = []
    vendors = CSV.read('./support/vendors.csv')
    vendors.each do |ven|
      all_vendors << self.new(id: ven[0], name: ven[1], num_employees: ven[2], market_id: ven[3])
    end
    all_vendors
  end

  def self.find(find_id)
    self.all.find { |vendor| vendor.id == find_id.to_s }
  end

  def self.by_market(find_market_id)
    self.all.find_all { |ven| ven.market_id == find_market_id }
  end

  def self.most_revenue(n)
    self.all.max_by(n) { |ven| ven.revenue }
  end

  def market
    FarMar::Market.all.find { |market| market.id == market_id }
  end

  def products
    FarMar::Product.all.find_all { |prod| prod.vendor_id == id }
  end

  def sales
    FarMar::Sale.all.find_all { |sale| sale.vendor_id == id }
  end

  def revenue
    my_sales = self.sales
    my_sales.map { |sale| sale.amount }.reduce(0,:+)
  end
end
