
class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  MARKET_FILE = "support/markets.csv"

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.all
    markets = []
    CSV.foreach(MARKET_FILE) do |row|
      markets << FarMar::Market.new(id: row[0].to_i, name: row[1], address: row[2],
      city: row[3], county: row[4], state: row[5], zip: row[6])
    end
    return markets
  end

  def self.find(id)
    self.all.find { |market| market.id == id }
  end

  def self.search(search_term)
    vendors = FarMar::Vendor.all.select { |vendor| vendor.name.upcase.include?(search_term.upcase) }
    vendor_names = vendors.collect { |vendor| vendor.markets }
    market_names = self.all.select { |market| market.name.upcase.include?(search_term.upcase) }
    return vendor_names + market_names
  end

  def vendors
    FarMar::Vendor.all.select { |vendor| vendor.market_id == id }
  end

  def preferred_vendor
    vendors.max_by { |vendor| vendor.revenue }
  end

  # def products
  #   # vendors => vendors by market
  #   # FarMar::Vendor.by_market(market_id) => vendors by market
  #   # FarMar::Product.by_vendor(vendor_id) => products by vendor
  #
  #
  # end

end
