require 'csv'
#require_relative "../far_mar"

class FarMar::Market
# ID - (Fixnum) a unique identifier for that market
# Name - (String) the name of the market (not guaranteed unique)
# Address - (String) street address of the market
# City - (String) city in which the market is located
# County - (String) county in which the market is located
# State - (String) state in which the market is located
# Zip - (String) zipcode in which the market is located
attr_reader :name, :address, :city, :county, :state, :zip
attr_accessor :id

  def initialize(market_data)
    # if market_data != nil
      @id             = market_data[:id].to_i #Fixnum
      @name           = market_data[:name] #String
      @address        = market_data[:address]#String
      @city           = market_data[:city]#String
      @county         = market_data[:county]#String
      @state          = market_data[:state]#String
      @zip            = market_data[:zip]#String
  end

  def self.all(filename = "./support/markets.csv")
    all_markets = []
    CSV.open(filename, 'r') do |csv|#CSV.read(file).map do |line|
      csv.read.each do |line|#above comment gets rid of line above
      all_markets << self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
      end
    end
    return all_markets
  end

  def self.find(id, filename = "./support/markets.csv")
    CSV.foreach(filename, 'r') do |line|
    #csv.read.each do |line|
        if line[0] == id.to_s
          selected_market = self.new(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
          return selected_market
        end
      end
  end

  #vendors: returns a collection of FarMar::Vendor instances
  #that are associated with the market by the market_id field.
  def vendors
    FarMar::Vendor.all.select { |vendor| vendor.market_id == id }
  end
end

#IRB for tesing:
  #   get all CSV data
  #   FarMar::Market.all
