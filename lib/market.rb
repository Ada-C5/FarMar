class FarMar::Market
  attr_reader :mar_id, :name

  FILE = './support/markets.csv'

  def initialize(id, name, address, city, county, state, zip)
    @mar_id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    markets = []
    CSV.foreach(FILE) do |line|
      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6].to_i
      markets << self.new(id, name, address, city, county, state, zip)
    end
    return markets
  end

  def self.find(id)
    markets = self.all
    markets.select do |market|
      return market if market.mar_id == id
    end
  end

  # return array of vendors in a specific market
  def vendors(mar_id)
    vendors = FarMar::Vendor.all 
    vendors.select { |vendor| vendor.mar_id == mar_id }
  end
end