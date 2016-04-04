## use this when testing in IRB, otherwise comment out
require_relative '../far_mar'

class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

# in charge of creating the instances.
  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_markets = CSV.read("./support/markets.csv")
    # returns a collection of instances, representing all of the objects described in the CSV
    all_markets.collect do |market|

      single_market_hash = {
        id: market[0].to_i,
        name: market[1],
        address: market[2],
        city: market[3],
        county: market[4],
        state: market[5],
        zip: market[6]
      }
      FarMar::Market.new(single_market_hash)
    end
  end

  def self.find(given_id)
    found_market = nil
    self.all.each do |market|
      if market.id == given_id
        found_market = market
      end
    end
    found_market
  end

  def vendors
    #returns a collection of FarMar::Vendor instances that are associated with
    # the market by the market_id field
    FarMar::Vendor.all.find_all {|vendor| vendor.market_id == id}
  end

  ### optional methods below, wheeeeee

  def preferred_vendor
    # returns the vendor with the highest revenue
    vendors.max_by {|vendor| FarMar::Vendor.find(vendor.id).revenue}
  end

  def worst_vendor
    # returns the vendor with the lowest revenue
    vendors.min_by {|vendor| FarMar::Vendor.find(vendor.id).revenue}
  end

  def products
    # returns a collection of FarMar::Product instances that are associated to
    # the market through the FarMar::Vendor class.
    array_of_product_arrays = vendors.map do |vendor|
      vendor.products # this is returning an array
    end
    array_of_product_arrays.flatten
  end

  def self.search(search_term)
  # returns a collection of FarMar::Market instances where the market name or
  # vendor name contain the search_term. For example FarMar::Market.search('school')
  # would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
  markets_with_search_term = FarMar::Market.all.find_all { |market| market.name.downcase.include?(search_term.downcase)}
  vendors_with_search_term = FarMar::Vendor.all.find_all {|vendor| vendor.name.downcase.include?(search_term.downcase)}
  markets_of_vendors = vendors_with_search_term.map do |vendor|
    vendor.markets
  end
  all_search_results = markets_with_search_term.push(markets_of_vendors)
  # to account for the fact that vendors_with_search_term returns an empty array if no results were found
  all_search_results.delete_if {|result| result == []}
  end

end
