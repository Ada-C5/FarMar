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
    keys = [:id, :name, :address, :city, :county, :state, :zip]
    market_hash = CSV.read('./support/markets.csv').map {|values| Hash[ keys.zip(values) ]}
    market_hash.each do |market|
      all_markets << self.new(market)
    end
    return all_markets
  end

  def self.find(find_id)
    self.all.each do |market|
      return market if market.id == find_id.to_s
    end
  end

  def vendors
    FarMar::Vendor.all.find_all { |ven| ven.market_id == id }
  end

end
