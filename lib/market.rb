class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :state, :zip

  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    @market_id = read_csv("./support/markets.csv")[csv_index][0]
    @name = read_csv("./support/markets.csv")[csv_index][1]
    @address = read_csv("./support/markets.csv")[csv_index][2]
    @city = read_csv("./support/markets.csv")[csv_index][3]
    @state = read_csv("./support/markets.csv")[csv_index][4]
    @zip = read_csv("./support/markets.csv")[csv_index][5]
  end

end
