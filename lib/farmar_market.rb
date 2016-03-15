require_relative '../farmar'
require_relative'./farmar_vendor'

class FarMar::Market

  def initialize(id, name, address, city, county, state, zip)
    @id         = id #market ID
    @name       = name
    @address    = address
    @city       = city
    @county     = county
    @state      = state
    @zip        = zip
  end

  def self.all
    all_markets = CSV.read("./support/markets.csv", "r")

    all_markets.collect do |individual_array|
      @id         = individual_array[0]
      @name       = individual_array[1]
      @address    = individual_array[2]
      @city       = individual_array[3]
      @county     = individual_array[4]
      @state      = individual_array[5]
      @zip        = individual_array[6]

      self.new(@id, @name, @address, @city, @county, @state, @zip)
    end
  end

  # self.find(id) - returns an instance of Market where the value of the id field in the CSV matches the passed parameter
  def self.find(id)
    all_markets = CSV.read("./support/markets.csv", "r")

    all_markets.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        return self.new(individual_array[0], individual_array[1], individual_array[2], individual_array[3], individual_array[4], individual_array[5], individual_array[6])
      end
    end
  end

  #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  def vendors
    FarMar::Vendor.market_vendors(@market_id)
  end


end
