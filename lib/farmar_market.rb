module FarMar
  class Market < DataClass

    attr_reader :id, :name

    def initialize(initialization_array)
      @id, @name, @street_address, @city, @county, @state, @zip = initialization_array
    end

    def products #this will make A LOT of loops... (if I do it the refactored way).  Not sure about it.
      vendors = self.vendors

      matched_products = vendors.collect do |vendor|
        vendor.products
      end
      matched_products.flatten!
    end

    def worst_vendor
      vendors = self.vendors
      lowest_revenue_vendor = vendors.min do |vendor|
        vendor.revenue
      end
      lowest_revenue_vendor
    end

    def prefered_vendor
      vendors = self.vendors
      highest_revenue_vendor = vendors.max do |vendor|
        vendor.revenue
      end
      highest_revenue_vendor
    end

    def vendors
      super('./support/vendors.csv', FarMar::Vendor, id, "market_id")
    end

    def self.search(search_term) # should this be broken up into a few methods?

      # find search_term in Market names
      all_markets = self.all
      markets_for_matched_market_name = all_markets.find_all do |market|
        market_name = market.name.downcase
        market_name.include?(search_term.downcase)
      end

      # find search_term in Vendor names
      all_vendors = FarMar::Vendor.all
      matched_vendor_name = all_vendors.find_all do |vendor|
        vendor_name = vendor.name.downcase
        vendor_name.include?(search_term.downcase)
      end

      # Market_ids where the matched_vendors sell
      market_ids_for_matched_vendor_name = matched_vendor_name.collect do |vendor|
        vendor.market_id
      end

      # Match the market_ids to the market instances
      markets_for_matched_vendor_name = all_markets.find_all do |market|
        market_ids_for_matched_vendor_name.include?market.id
      end

      # These are the markets you're looking for...
      all_matched_markets = markets_for_matched_market_name.concat(markets_for_matched_vendor_name)
      return all_matched_markets
    end

    def self.find(data_file = './support/markets.csv', id)
      super('./support/markets.csv', id)
    end

    def self.all(data_file = './support/markets.csv' )
      super('./support/markets.csv')
    end

  end
end
