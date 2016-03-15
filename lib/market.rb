require 'csv'
#require_relative '../far_mar'


class FarMar::Market

  attr_reader :id, :name, :address, :city, :county, :state, :zip
  def initialize(market_info)
    @id       = market_info [ :id ]         # (Fixnum) a unique identifier for that market
    @name     = market_info [ :name]        # (String) the name of the market (not guaranteed unique)
    @address  = market_info [ :address ]    # (String) street address of the market
    @city     = market_info [ :city ]       # (String) city in which the market is located
    @county   = market_info [ :county ]     # (String) county in which the market is located
    @state    = market_info [ :state ]      # (String) state in which the market is located
    @zip      = market_info [ :zip ]        # (String) zipcode in which the market is located
  end

  def self.all
    markets_csv_info = CSV.read("./support/markets.csv")  # an array of each line as an element
    markets_csv_info.map { |line| self.new( id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6] )}
  end

  def self.find(id)
    self.all.select {|market| id.to_i == market.id }
  end

  # return a list of vendor instances (FarMar::Vendor) by matching market_id
  def vendor
    FarMar::Vendor.all.select {|vendor| id.to_i == vendor.market_id.to_i}[0]
  end

end
