
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
    #find vendors whose names match the search term and collect their ids
    vendor_matches = CSV.read(VENDORS_CSV).select do |line|
      line[1].downcase.include? search_term.downcase
    end
    vendor_ids = vendor_matches.collect { |vendor| vendor[3]}

    #iterate through markets to see if any market names match search term
    market_matches = CSV.read(MARKET_CSV).select do |line|
      (line[1].downcase.include? search_term.downcase) || (vendor_ids.include? line[0])
    end
    market_matches.collect { |market| FarMar::Market.new(market)}

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
    #when you give a day it defaults to noon, so i caught the whole day by adding and substracting 11hours 59min
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
end
