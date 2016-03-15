
class FarMar::Market
  attr_reader :id, :name
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
    all_markets = []
    CSV.foreach("support/markets.csv", "r") do |line|
      all_markets << self.new({:id => line[0], :name => line[1], :address => line[2], :city => line[3], :county => line[4], :state => line[5], :zip => line[6]})
    end
    return all_markets
  end

  def self.find(id)
    self.all.each do |market_inst|
      if market_inst.id.to_s == id.to_s
        return market_inst
      end
    end
    return false
  end

  def vendors
    #Returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    FarMar::Vendor.all.find_all { |vendor| vendor.market_id == @id}
  end

end
