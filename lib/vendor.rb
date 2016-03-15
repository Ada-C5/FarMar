class FarMar::Vendor

  attr_reader :id, :name, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_employees = vendor_hash[:num_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    all_vendors = []
    keys = [:id, :name, :num_employees, :market_id]
    vendor_hash = CSV.read('./support/vendors.csv').map {|values| Hash[ keys.zip(values) ]}
    vendor_hash.each do |vendor|
      all_vendors << self.new(vendor)
    end
    return all_vendors
  end

  def self.find(find_id)
    self.all.each do |vendor|
      return vendor if vendor.id == find_id.to_s
    end
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

end
