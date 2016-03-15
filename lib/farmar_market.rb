
class FarMar::Market

  attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @market_id = market_hash[:market_id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  # self.all: returns a collection of instances, representing all of the objects described in the CSV

  def self.all
    csv_market_array = []
    CSV.open("./support/markets.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_market_array << FarMar::Market.new(market_id: row[0].to_i, name: row[1].to_s, address: row[2].to_s, city: row[3].to_s, county: row[4].to_s, state: row[5].to_s, zip: row[6].to_i)
      end
      return csv_market_array
    end
  end

  # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

  def self.find(id)
    found = self.all.find_all { |market| market.market_id == id}
    return found[0]
  end

#vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.

  def vendors
    FarMar::Vendor.all.find_all { |vendor| vendor.market_id == @market_id }
  end
end
