
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

  def self.all
    csv_market_array = []
    CSV.open("./support/markets.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_market_array << FarMar::Market.new(market_id: row[0].to_i, name: row[1].to_s, address: row[2].to_s, city: row[3].to_s, county: row[4].to_s, state: row[5].to_s, zip: row[6].to_i)
      end
      return csv_market_array
    end
  end

  def self.find(id)
    CSV.open("./support/markets.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == id
          found_account = FarMar::Market.new(market_id: row[0].to_i, name: row[1].to_s, address: row[2].to_s, city: row[3].to_s, county: row[4].to_s, state: row[5].to_s, zip: row[6].to_i)
          return [found_account]
        end
      end
    end
  end
end
