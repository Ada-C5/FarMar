class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id].to_i
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.all
    CSVHasher.hashify('./support/markets.csv').collect { |m| FarMar::Market.new(m) }
  end

  def self.find(id)
    FarMar::Market.all.select { |m| m.id == id }[0]
  end

  def vendors
    FarMar::Vendor.all.select { |v| @id == v.market_id }
  end

end
