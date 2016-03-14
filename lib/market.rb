class FarMar::Market
  attr_reader :market_id, :name, :address, :city, :state, :zip

  def self.read_csv(file)
    CSV.read(file, 'r')
  end


  def initialize(csv_index)
    csv = FarMar::Market.read_csv("./support/markets.csv")

    @market_id = csv[csv_index][0]
    @name = csv[csv_index][1]
    @address = csv[csv_index][2]
    @city = csv[csv_index][3]
    @state = csv[csv_index][4]
    @zip = csv[csv_index][5]
  end

  # def self.all
  #   all = []
  #   all_csv = read_csv("./support/markets.csv")
  #   all_csv.each do |index|
  #   all << FarMar::Market.new(index)
  #   end
  # end



end
