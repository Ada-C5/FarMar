class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :state, :zip

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/markets.csv"
  MARKET_CSV = FarMar::Market.read_csv(FILE)

  def initialize(csv_index)
    @market_id = MARKET_CSV[csv_index][0]
    @name =      MARKET_CSV[csv_index][1]
    @address =   MARKET_CSV[csv_index][2]
    @city =      MARKET_CSV[csv_index][3]
    @state =     MARKET_CSV[csv_index][4]
    @zip =       MARKET_CSV[csv_index][5]
  end

  def self.all
    allmarkets = []
    MARKET_CSV.length.times do |index|
      allmarkets << FarMar::Market.new(index)
    end
    return allmarkets
  end

end
