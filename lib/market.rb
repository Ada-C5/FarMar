class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip, :markets_with_nil

  def initialize(market_hash)
    @id      = market_hash[:id]
    @name    = market_hash[:name]
    @address = market_hash[:address]
    @city    = market_hash[:city]
    @county  = market_hash[:county]
    @state   = market_hash[:state]
    @zip     = market_hash[:zip]
  end

  def self.markets_with_nil
    markets_with_nil = []
    FarMar::Market.all.each do |mar|
      markets_with_nil << "#{mar.name} - id" if mar.id.nil?
      markets_with_nil << "#{mar.id} - name" if mar.name.nil?
      markets_with_nil << "#{mar.id} - address" if mar.address.nil?
      markets_with_nil << "#{mar.id} - city" if mar.city.nil?
      markets_with_nil << "#{mar.id} - county" if mar.county.nil?
      markets_with_nil << "#{mar.id} - state" if mar.state.nil?
      markets_with_nil << "#{mar.id} - zip" if mar.zip.nil?
    end
    return markets_with_nil
  end

  def self.all
    all_markets = []
    markets = CSV.read('./support/markets.csv')
    markets.each do |mar|
      all_markets << self.new(id: mar[0], name: mar[1], address: mar[2], city: mar[3], county: mar[4], state: mar[5], zip: mar[6])
    end
    all_markets
  end

  def self.find(find_id)
    self.all.each do |market|
      return market if market.id == find_id.to_s
    end
  end

  def self.search(search_term)
    match_vendor_market_id = FarMar::Vendor.all.find_all { |mar| mar.name.downcase.include?(search_term.downcase) }.collect { |ven| ven.market_id }
    match_vendor_name = FarMar::Market.all.find_all { |mar| match_vendor_market_id.include? mar.id }
    match_market_name = FarMar::Market.all.find_all { |mar| mar.name.downcase.include?(search_term.downcase) }
    match_market_name.concat match_vendor_name
  end

  def vendors
    FarMar::Vendor.all.find_all { |ven| ven.market_id == id }
  end

  def products
    market_vendors = self.vendors
    market_vendors_ids = market_vendors.collect { |ven| ven.id }
    FarMar::Product.all.find_all { |prod| market_vendors_ids.include? prod.vendor_id }
  end

  def prefered_vendor
    self.vendors.max_by { |ven| ven.revenue }
  end

  def worst_vendor
    self.vendors.min_by { |ven| ven.revenue }
  end

end
