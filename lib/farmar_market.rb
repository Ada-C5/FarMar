# lib/farmar_market.rb
class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip
  def initialize(hash)
    # @markets = CSV.read('../support/markets.csv')
    @id = hash[:id]
    @name = hash[:name]
    @address = hash[:address]
    @city = hash[:city]
    @county = hash[:county]
    @state = hash[:state]
    @zip = hash[:zip]
  end

  # ID - (Fixnum) a unique identifier for that market
  # Name - (String) the name of the market (not guaranteed unique)
  # Address - (String) street address of the market
  # City - (String) city in which the market is located
  # County - (String) county in which the market is located
  # State - (String) state in which the market is located
  # Zip - (String) zipcode in which the market is located

  # creates instances (500) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    markets_info = []
    CSV.foreach("support/markets.csv") do |row|
      info = self.new(id: row[0].to_i, name: row[1], address: row[2],
      city: row[3], county: row[4], state: row[5], zip: row[6])
      markets_info << info
    end
    return markets_info
  end

  def self.find(id)
    self.all.each do |instance|
      if instance.id == id.to_i
        return instance
      end
    end
  end

  def vendors
    FarMar::Vendor.all.find_all {|instance| instance.market_id == id}
  end


end
