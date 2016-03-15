class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :state, :zip

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/markets.csv"
  MARKET_CSV = FarMar::Market.read_csv(FILE)

  def initialize(market_id)
    market_id -= 1
    @market_id = MARKET_CSV[market_id][0].to_i
    @name =      MARKET_CSV[market_id][1]
    @address =   MARKET_CSV[market_id][2]
    @city =      MARKET_CSV[market_id][3]
    @state =     MARKET_CSV[market_id][4]
    @zip =       MARKET_CSV[market_id][5]
  end

  def self.all
    markets = []
    MARKET_CSV.length.times do |index|
      markets << FarMar::Market.new(index)
    end
    return markets
  end

  def self.find(market_id)
    return FarMar::Market.new(market_id)
  end

  def self.vendors(market_id)
    vendor_instances = []
    FarMar::Vendor::VENDOR_CSV.collect do |vendor|
      vendor_market_id = vendor[-1].to_i
      if vendor_market_id == market_id
        vendor_instances << FarMar::Vendor.new(vendor[0].to_i)
      end
    end
    return vendor_instances
  end
end
