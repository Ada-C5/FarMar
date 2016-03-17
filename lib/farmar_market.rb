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
      super(data_file, id)
    end

    def self.all(data_file = './support/markets.csv' )
      super(data_file)
    end

    # def self.all_markets_nil_id
    # # used this to check for sales that had a nil product id... still not sure what to do with them
    #   all_markets = self.all
    #   markets_with_nil_pid = all_markets.find_all do |market|
    #     market.id == nil || market.id == nil
    #   end
    #
    #   markets_with_nil_pid
    # end


  end
end
