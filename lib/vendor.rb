class FarMar::Vendor
  attr_reader :id, :name, :market_id

  extend FarMar::FarMarMethods
  
  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @number_employees = info_hash[:number_employees].to_i
    @market_id = info_hash[:market_id].to_i
  end

  def self.all(file_name = './support/vendors.csv')
    vendor_keys = [:id, :name, :number_employees, :market_id]

    make_all(file_name, vendor_keys)
  end

  # returns all vendors with the given market id
  def self.by_market(id_of_market)
    self.all.find_all do |vendor|
      vendor.market_id == id_of_market
    end
  end

  # returns the associated market instance
  def market
    FarMar::Market.find(market_id)
  end

  # returns an array of associated products
  def products
    FarMar::Product.by_vendor(id)
  end

  # returns an array of associated sales
  def sales
    FarMar::Sale.get_by("vendor", id)
  end

  # returns the sum of all sales in cents
  def revenue
    sales.reduce(0) { |sum, sale| sum + sale.amount }
  end
end