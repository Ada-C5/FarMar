class FarMar::Market

  attr_reader :id, :name

  def initialize(market_hash)
    @id      = market_hash[:id]
    @name    = market_hash[:name]
    @address = market_hash[:address]
    @city    = market_hash[:city]
    @county  = market_hash[:county]
    @state   = market_hash[:state]
    @zip     = market_hash[:zip]
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
