class FarMar::Market
  attr_reader :mar_id, :name

  FILE = './support/markets.csv'

  def initialize(id, name, address, city, county, state, zip)
    @mar_id = id
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
    self.all.find { |market| market.mar_id == id }
  end

  # return array of vendors in a specific market
  def vendors(mar_id)
    FarMar::Vendor.all.select { |vendor| vendor.mar_id == mar_id }
  end

  # returns collection of PRODUCT instances associated to market via Vendor class
  def products(mar_id)
    vendors = FarMar::Vendor.by_market(mar_id)
    products = FarMar::Product.all
    product_array = []
    vendors.each do |vendor|
      products.each do |product|
        if product.ven_id == vendor.ven_id
          product_array << product
        end
      end
    end
    return product_array
  end

  # returns collection of Market instances where market/vendor name share the same search term
  def self.search(search_term)
    return_markets = []
    search_term = search_term.upcase
    # search through markets, if names match, put in array
    self.all.each do |market|
      if market.name.upcase.include?(search_term)
        return_markets << market
      # if the name does not include search_term, search through the market's vendors
      else
        vendors = FarMar::Vendor.by_market(market.mar_id)
        vendors.each do |vendor|
          if vendor.name.upcase.include?(search_term)
            return_markets << market
          end
        end
      end
    end
    return return_markets
  end

  # returns vendor with highest revenue
  def prefered_vendor
    vendors = vendors(mar_id)
    vendors.max_by { |vendor| vendor.revenue(vendor.ven_id) }
  end
end