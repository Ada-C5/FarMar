# lib/farmar_market.rb
class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip
  def initialize(hash)
    @id = hash[:id].to_i
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
      info = self.new(id: row[0], name: row[1], address: row[2],
      city: row[3], county: row[4], state: row[5], zip: row[6])
      markets_info << info
    end
    return markets_info
  end

  # finds all instances of market that match the given id
  def self.find(id)
    self.all.each do |instance|
      if instance.id == id.to_i
        return instance
      end
    end
  end

  # returns all instances of vendors based on given market_id
  def vendors
    FarMar::Vendor.all.find_all {|instance| instance.market_id == id}
  end

  # returns a collection of product instances by referring to the vendor id's
  # from #vendors. shovels the products into subarrays within prod array
  def products
    prod = []
    vendors.each do |vendor_instance|
      prod << FarMar::Product.all.find_all {|instance| instance.vendor_id ==
        vendor_instance.id}
    end
    return prod
  end

  # returns a collection of market instance where the market name of vendor name
  # contain the search_term
  def self.search(search_term)
    market = self.all.find_all {|instance| instance.name.downcase.include?(search_term)}
    vendor = FarMar::Vendor.all.find_all{|instance| instance.name.downcase.include?(search_term)}
    match = market + vendor
    return match
  end

end
