class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :state, :zip

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/markets.csv"
  MARKET_CSV = FarMar::Market.read_csv(FILE)

  def initialize(csv_index)
    @market_id = MARKET_CSV[csv_index][0].to_i
    @name =      MARKET_CSV[csv_index][1]
    @address =   MARKET_CSV[csv_index][2]
    @city =      MARKET_CSV[csv_index][3]
    @state =     MARKET_CSV[csv_index][4]
    @zip =       MARKET_CSV[csv_index][5]
  end

  def self.all
    markets = []
    MARKET_CSV.length.times do |index|
      markets << FarMar::Market.new(index)
    end
  end

  def self.find(id)
    MARKET_CSV.each do |market|
      if market[0].to_i == id.to_i
        return market
      end
    end
  end
end
