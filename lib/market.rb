class FarMar::Market
  attr_reader :id, :name

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

  def vendors
    FarMar::Vendor.by_market(id)
  end

  def products
    products = []
    vendors.each do |vendor|
      products.push *FarMar::Product.by_vendor(vendor.id)
    end

    return products
  end
end