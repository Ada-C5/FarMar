class FarMar::Market
  attr_reader :id, :name

  # module mixin
  extend FarMar::FarMarMethods

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @address = info_hash[:address]
    @city = info_hash[:city]
    @county = info_hash[:county]
    @state = info_hash[:state]
    @zip = info_hash[:zip]
  end

  def self.all(file_name = './support/markets.csv')
    market_keys = [:id, :name, :address, :city, :county, :state, :zip]

    # use mixin module FarMar::FarMarMethods#make_all
    make_all(file_name, market_keys)
  end

  def self.search(search_term)
    search_term.downcase!

    # get all markets to pass to name matching method
    all_markets = self.all
    market_list = self.match_name(search_term, all_markets)

    # get all vendors to pass to name matching method
    all_vendors = FarMar::Vendor.all

    # returned from match_name is an array of vendor instances
    vendors = self.match_name(search_term, all_vendors)

    # append the associated market instances (linked through vendor's market_id)
    market_list.push *vendors.collect { |vendor| self.find(vendor.market_id) }
  end

  def self.match_name(search_term, array)
    array.find_all do |item|
      item.name.downcase.include? search_term
    end
  end

  def self.find_by_name(match)
    match = match.downcase
    self.all.find do |market|
      market.name.downcase == match
    end
  end

  # returns a collection of vendor instances related to market through market_id
  def vendors
    FarMar::Vendor.by_market(id)
  end

  # returns a collection of product instances associated to market through the vendor.
  def products
    products = vendors.map do |vendor|
      FarMar::Product.by_vendor(vendor.id)
    end

    # make nested arrays into a single array using array method #flatten
    products.flatten
  end

  # returns the vendor with the highest revenue (either total or on a specific date)
  def preferred_vendor(date = nil)
    vendors.max_by { |vendor| vendor.revenue(date) }
  end

  # returns the vendor with the lowest revenue IF THEY SOLD SOMETHING THAT DAY
  # does not count any vendors that didn't sell on a particular date in case
  # they weren't present at that particular market on that day
  def worst_vendor(date = nil)
    all_vendors = vendors
    all_vendors_on_day = all_vendors.reject{|vendor| vendor.revenue(date).zero?}
    all_vendors_on_day.min_by { |vendor| vendor.revenue(date) }
  end
end