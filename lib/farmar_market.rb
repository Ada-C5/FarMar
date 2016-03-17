module FarMar
  class Market < DataClass

    attr_reader :id

    def initialize(initialization_array)
      @id, @name, @street_address, @city, @county, @state, @zip = initialization_array
    end

    def products #this will make A LOT of loops... (if I do it the refactored way)
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

    def self.find(data_file = './support/markets.csv', id)
      super('./support/markets.csv', id)
    end

    def self.all(data_file = './support/markets.csv' )
      super('./support/markets.csv')
    end

  end
end
