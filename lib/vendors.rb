class FarMar::Vendor
  attr_accessor :vendor_id, :vendor_name, :num_employees, :market_id

  def initialize(id, name, employees, market_id)
    @vendor_id = id
    @vendor_name = name
    @num_employees = employees
    @market_id = market_id
  end

  def self.all
    csv_array = CSV.read('support/vendors.csv')
    @all_vendors = csv_array.collect do |row|
      self.new(row[0].to_i,row[1],row[2],row[3].to_i)
    end
    #return to the array  @all_vendors with all the vendors in the file instanciated
    # Array of objects
  end

  def self.find(id)
    FarMar::Vendor.all
    @all_vendors.each do |vendor|
      if vendor.vendor_id == id.to_i
        return vendor
      end
    end
  end

  def market
    #vendor_test = FarMar::Vendor.new("18", "David Jimison", "1", "404")
    the_vendors_market = []
    FarMar::Market.all.each do |market|
      if market.market_id == market_id.to_i
        the_vendors_market << market
      end
    end
    return the_vendors_market
  end

  def products
    the_vendors_product = FarMar::Product.all.select { |product| product.vendor_id == vendor_id.to_i }
  end

  def sales
    the_vendors_sale = FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id.to_i }
  end

  def revenue
    @sume = 0
    all_sales = []
    FarMar::Sale.all.each do |sale_info|
      all_sales << sale_info.ammount
    end
    all_sales.reduce(:+)

  end

end
