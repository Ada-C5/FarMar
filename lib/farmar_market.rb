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

    def self.search(search_term)

      all_markets = self.all
      matched_market_name = all_markets.find_all do |market|
        market_name = market.name.downcase
        market_name.include?(search_term.downcase)
      end

      matched_market_name

      # all_vendors = FarMar::Vendor.all
      # matched_vendor_name = all_vendors.find_all do |vendor|
      #   vendor_name = vendor.name.downcase
      #   vendor_name.include?(search_term.downcase)
      # end
      #
      # market_ids_for_matched_vendor_name = matched_vendor_name.collect do |vendor|
      #   vendor.market_id
      # end
      #
      # markets_for_matched_vendor_name = all_markets.find_all do |market|
      #   market_ids_for_matched_vendor_name.include?market.id
      # end
      #
      # matched_market_name << markets_for_matched_vendor_name
      # matched_market_name.uniq!

    end

    def self.find(data_file = './support/markets.csv', id)
      super('./support/markets.csv', id)
    end

    def self.all(data_file = './support/markets.csv' )
      super('./support/markets.csv')
    end

  end
end
