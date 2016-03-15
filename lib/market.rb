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

  def self.list_markets_missing_info
    FarMar::Market.all.each do |mar|
      puts "#{mar.id} is missing id." if mar.id.nil?
      puts "#{mar.id} is missing name." if mar.name.nil?
      puts "#{mar.id} is missing address." if mar.address.nil?
      puts "#{mar.id} is missing city." if mar.city.nil?
      puts "#{mar.id} is missing county." if mar.county.nil?
      puts "#{mar.id} is missing state." if mar.state.nil?
      puts "#{mar.id} is missing zip." if mar.zip.nil?
    end
  end

  def self.markets_with_nil
    markets_with_nil = []
    FarMar::Market.all.each do |mar|
      markets_with_nil << mar.id  if mar.id.nil?
      markets_with_nil << mar.id  if mar.name.nil?
      markets_with_nil << mar.id  if mar.address.nil?
      markets_with_nil << mar.id  if mar.city.nil?
      markets_with_nil << mar.id  if mar.county.nil?
      markets_with_nil << mar.id  if mar.state.nil?
      markets_with_nil << mar.id  if mar.zip.nil?
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
