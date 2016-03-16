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
      markets << self.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6].to_i)
    end
    return markets
  end

  def self.find(id)
    self.all.find { |market| market.mar_id == id }
  end

  # return array of vendors in a specific market
  def vendors(mar_id)
    FarMar::Vendor.all.select { |vendor| vendor.mar_id == mar_id }
  end
end