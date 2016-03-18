class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id].to_i
    @name = vendor_hash[:name]
    @employee_num = vendor_hash[:employee_num].to_i
    @market_id = vendor_hash[:market_id].to_i
  end

  def self.all
    CSVHasher.hashify('./support/vendors.csv').collect { |n| FarMar::Vendor.new(n) }
  end

  def self.find(id)
    FarMar::Vendor.all.select { |v| v.id == id }[0]
  end

  def self.by_market(market_id)
    FarMar::Vendor.all.select { |v| v.market_id == market_id }
  end

  def market
    FarMar::Market.all.select { |m| m.id == @market_id }[0]
  end

  def products
    FarMar::Product.all.select { |p| p.vendor_id == @id }
  end

  def sales
    FarMar::Sale.all.select { |s| s.vendor_id == @id }
  end

  def revenue
    sales.collect { |s| s.amount }.reduce(0, :+)
  end

end
