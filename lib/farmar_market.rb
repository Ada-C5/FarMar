
class FarMar::Market < RepeatMethods
  DATA = "./support/markets.csv"

  attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(market_info)
    @market_id, @name, @address, @city, @county, @state, @zip = market_info
    @market_id = @market_id.to_i
  end

  # vendors: returns a collection of FarMar::Vendor instances that are associated with
  # the market by the market_id field.
  def vendors
    vendors = CSV.read(VENDORS_CSV).select { |line| line[3].to_i == self.market_id }
    vendors.collect { |v| FarMar::Vendor.new(v)}
  end

  # products returns a collection of FarMar::Product instances that are associated to the
  # market through the FarMar::Vendor class.
  # use vendors method to find vendors, make instances of their products
  def products
    vendor_ids = vendors.collect { |vendor| vendor.vendor_id}
    CSV.read(PRODUCT_CSV).collect do |line|
      FarMar::Product.new(line) if vendor_ids.include? line[2].to_i
    end
  end


  # self.search(search_term) returns a collection of FarMar::Market instances
  # where the market name or vendor name contain the search_term.
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

  #prefered_vendor(date): returns the vendor with the highest revenue for the given date
  def preferred_vendor_on(date)
    date = Chronic.parse(date)
    time_range = ((date - 43199)..(date + 43199))
    vendor_ids = self.vendors.collect { |vendor| vendor.vendor_id }
    vendor_sales = CSV.read(SALE_CSV).select do |line|
      vendor_ids.include? line[3].to_i
      end
    vendor_sales.collect! { |sale| FarMar::Sale.new(sale) }
    vendor_sales.select  { |sale| time_range.include? sale.purchase_time }
    #create a hash that will assign a key to each vendor id and add amount to value
    answer = {}
    vendor_sales.each do |sale|
      vendor = sale.vendor_id
      amount = sale.amount

      if answer[vendor].nil?
        answer[vendor] = amount
      else
        answer[vendor] += amount
      end
    end
    answer = answer.max_by { |vendor, amount| amount}
    return FarMar::Vendor.find(answer[0])

  end

  # # worst_vendor(date): returns the vendor with the lowest revenue on the given date
  # def worst_vendor_on(date)
  # end

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
