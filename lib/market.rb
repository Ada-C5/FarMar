class FarMar::Market
  attr_reader :id, :name

  FILE = './support/markets.csv'

  def initialize(id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    markets = []
    CSV.foreach(FILE) do |line|
      markets << self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6].to_i)
    end
    return markets
  end

  def self.find(id)
    self.all.find { |market| market.id == id }
  end

  # return array of vendors in a specific market
  def vendors(market_id)
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id }
  end

  # returns collection of PRODUCT instances associated to market via Vendor class
  def products(market_id)
    vendors = FarMar::Vendor.by_market(market_id)
    products = FarMar::Product.all
    product_array = []
    vendors.each do |vendor|
      products.each do |product|
        if product.vendor_id == vendor.id
          product_array << product
        end
      end
    end
    return product_array
  end

  # returns collection of Market instances where market or vendor name share the same search term
  def self.search(search_term)
    search_term = search_term.upcase
    vendors = FarMar::Vendor.all.find_all { |vendor| vendor.name.upcase.include?(search_term)}
    markets = self.all.find_all { |market| market.name.upcase.include?(search_term)}
    markets = markets + vendors
    return markets
  end

  # returns vendor with highest revenue
  def prefered_vendor
    vendors = vendors(self.id)
    vendors.max_by { |vendor| vendor.revenue(vendor.id) }
  end

  # returns vendor with highest revenue on a certain date
  def prefered_ven(date)
    date = Time.parse(date)
    vendors = vendors(self.id)
    from_date = []
    vendors.each do |vendor|
      sales = vendor.sales(vendor.id)
      sales.each do |sale|
        time = Time.parse(sale.purchase_time.to_s)
        if time.day == date.day
          from_date << vendor
        end
      end
    end
    # go through vendor sales from date parameter
    from_date.max_by { |vendor| vendor.revenue(vendor.id) }
  end
end