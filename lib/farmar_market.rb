module FarMar
  class Market < DataClass

    attr_reader :id

    def initialize(initialization_array)
      @id, @name, @street_address, @city, @county, @state, @zip = initialization_array
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
