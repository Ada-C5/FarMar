module FarMar
  class Market < DataClass

    attr_reader :id

    def initialize(initialization_array)
      @id, @name, @street_address, @city, @county, @state, @zip = initialization_array
    end

    def vendors
      super('./support/vendors.csv', FarMar::Vendor, id, "market_id")
    end

    def self.find(data_file = './support/markets.csv', id) # returns an instance of Market where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      markets = self.all(data_file)
      markets.each do |market|
        return market if market.id == id
      end
    end

    def self.all(data_file = './support/markets.csv' )
      super(data_file)
    end


  end
end
