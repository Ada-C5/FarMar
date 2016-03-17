
class FarMar::Vendor
  attr_reader :id, :name, :num_employees, :market_id

  VENDOR_FILE = "support/vendors.csv"

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_employees = vendor_hash[:num_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    vendors = []
    CSV.foreach(VENDOR_FILE) do |row|
      vendors << FarMar::Vendor.new(id: row[0].to_i, name: row[1], num_employees: row[2].to_i,
        market_id: row[3].to_i)
    end
    return vendors
  end

  def self.find(id)
    self.all.find { |vendor| vendor.id == id }
  end

  def self.by_market(market_id)
    self.all.find_all { |vendor| vendor.market_id == market_id }
  end

  def markets
    FarMar::Market.all.find { |market| market.id == market_id }
  end

  def products
    FarMar::Product.all.select { |product| product.vendor_id == id }
  end

  def sales
    FarMar::Sale.all.select { |sale| sale.vendor_id == id }
  end

  def revenue
    sales.reduce(0) { |sum, sale| sum += sale.amount }
  end

end
