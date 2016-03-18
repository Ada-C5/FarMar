class FarMar::Vendor < FarMar::FarMarClass
  attr_reader :name, :id, :market_id
  FILE = './support/vendors.csv'

  def initialize(id, name, num_of_employees, mar_id)
    @id = id.to_i
    @name = name
    @num_of_employees = num_of_employees.to_i
    @market_id = mar_id.to_i
  end

  # find all vendors with given market_id
  def self.by_market(market_id)
    self.all.find_all { |vendor| vendor.market_id == market_id}
  end

  # returns instance of market related to this vendor
  def market(market_id)
    markets = FarMar::Market.all
    markets.find { |market| market.id == market_id}
  end

  # returns product instances for vendor_id as array
  def products(vendor_id)
    FarMar::Product.all.select { |product| product.vendor_id == vendor_id}
  end

  # returns collection of sale instances that go with vendor_id
  def sales(vendor_id)
    FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id}
  end

  # returns sum of all vendors sales in cents
  def revenue(vendor_id)
    sales(vendor_id).reduce(0) { |total, sale| total += sale.amount }
  end
end