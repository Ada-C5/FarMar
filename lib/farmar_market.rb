
class FarMar::Market

  attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(market_info)
    @market_id, @name, @address, @city, @county, @state, @zip = market_info
    @market_id = @market_id.to_i
  end

  def self.all
    CSV.read(MARKET_CSV).map { |line|  self.new(line) }
  end

  def self.find(id)
    CSV.foreach(MARKET_CSV) do |line|
      return self.new(line) if line[0].to_i == id
    end
  end

  # products returns a collection of FarMar::Product instances that are associated to the
  # market through the FarMar::Vendor class.
  # use vendors method to find vendors, make instances of their products
  def products
    vendor_ids = vendors.collect { |vendor| vendor.vendor_id}
    all_products = CSV.read(PRODUCT_CSV).select do |line|
      vendor_ids.include? line[2].to_i
    end
    all_products.collect { |product| FarMar::Product.new(product) }
  end

  # vendors: returns a collection of FarMar::Vendor instances that are associated with
  # the market by the market_id field.
  def vendors
    vendors = CSV.read(VENDORS_CSV).select do |line|
      line[3].to_i == self.market_id
    end
    vendors.collect { |v| FarMar::Vendor.new(v)}
  end

  # self.search(search_term) returns a collection of FarMar::Market instances
  # where the market name or vendor name contain the search_term.
  # For example FarMar::Market.search('school') would return 3 results, one being the
  # market with id 75 (Fox School Farmers FarMar::Market).
  def self.search(search_term)
    matches = CSV.read(MARKET_CSV).select do |line|
      line[1].downcase.include? search_term
    end
    matches.collect { |market| FarMar::Market.new(market)}

  end

  # prefered_vendor: returns the vendor with the highest revenue
  def preferred_vendor
    self.vendors.max_by { |vendor| vendor.revenue}
  end
  
  def worst_vendor
    self.vendors.min_by { |vendor| vendor.revenue}
  end

  # prefered_vendor(date): returns the vendor with the highest revenue for the given date
  # def preferred_vendor_on(date)
  #   date = Chronic.parse(date)
  #   time_range = ((date - 43199)..(date + 43199))
  #   vendor_ids = self.vendors.collect { |vendor| vendor.vendor_id }
  #   vendor_sales = CSV.read(SALE_CSV).select do |line|
  #     vendor_ids.include? line[3].to_i
  #     end
  #   vendor_sales.collect { |sale| FarMar::Sale.new(sale) }
  #   vendor_sales.select  { |sale| time_range.include? sale.purchase_time }
  #   #vendor_sales.select { |sale| time_range.include? sale.purchase_time}
  #
  # end

  #vendor_ids = self.vendors.collect { |vendor| vendor.vendor_id }
  # end


  # vendor_sales.select { |sale| time_range.include? sale.purchase_time }
  # worst_vendor: returns the vendor with the lowest revenue

  # worst_vendor(date): returns the vendor with the lowest revenue on the given date
  def worst_vendor_on(date)
  end

end



















# def vendors_take_1
#   FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id}
# end

#products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
#self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
#prefered_vendor: returns the vendor with the highest revenue
#prefered_vendor(date): returns the vendor with the highest revenue for the given date
#worst_vendor: returns the vendor with the lowest revenue
#worst_vendor(date): returns the vendor with the lowest revenue on the given date
