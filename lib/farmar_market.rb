require_relative '../farmar'

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
    require "CSV"
    all_markets = CSV.read("./support/markets.csv", "r")

    all_markets.each do |individual_array|
      @id         = individual_array[0]
      @name       = individual_array[1]
      @address    = individual_array[2]
      @city       = individual_array[3]
      @county     = individual_array[4]
      @state      = individual_array[5]
      @zip        = individual_array[6]
    end
  end

  # self.find(id) - returns an instance of Market where the value of the id field in the CSV matches the passed parameter
  def self.find(id)
    require "CSV"
    all_markets = CSV.read("./support/markets.csv", "r")

    all_markets.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        puts "ID:           #{individual_array[0]}"
        puts "Market Name:  #{individual_array[1]}"
        puts "Address:      #{individual_array[2]}"
        puts "City:         #{individual_array[3]}"
        puts "County:       #{individual_array[4]}"
        puts "State:        #{individual_array[5]}"
        puts "Zip Code:     #{individual_array[6]}"
      end
    end
  end


end
