class FarMar::Vendor
  attr_accessor :vendor_id, :vendor_name, :num_employees, :market_id

  def initialize(id, name, employees, market_id)
    @vendor_id = id
    @vendor_name = name
    @num_employees = employees
    @market_id = market_id
  end

  def self.all
    CSV.read('support/vendors.csv').collect { |row| self.new(row[0].to_i,row[1],row[2],row[3].to_i)}
  end

  def self.find(id)
    FarMar::Vendor.all.each do |vendor|
      if vendor.vendor_id == id.to_i
        return vendor
      end
    end
  end

  def market
    FarMar::Market.all.select { |market| market.market_id == market_id.to_i }
  end

  def products
    FarMar::Product.all.select { |product| product.vendor_id == vendor_id.to_i }
  end

  def sales
    FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id.to_i }
  end

  def revenue
    @sume = 0
    all_sales = []
    FarMar::Sale.all.each do |sale_info|
      all_sales << sale_info.ammount
    end
    all_sales.reduce(:+)

  end

  def self.by_market(market_id_given)
    #returns all of the vendors with the given market_id
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id_given.to_i }
  end

end
