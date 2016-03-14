module FarMar
  class Market < DataClass

    attr_reader :id

    def initialize(market_information)
      @id             = market_information[:id]
      @name           = market_information[:name]
      @street_address = market_information[:street_address]
      @city           = market_information[:city]
      @county         = market_information[:county]
      @state          = market_information[:state]
      @zip            = market_information[:zip]

    end

    def vendors
      super('./support/vendors.csv', FarMar::Vendor)
    end

    def self.find(data_file = './support/markets.csv', id) # returns an instance of Market where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      markets = self.all(data_file)
      markets.each do |market|
        return market if market.id == id
      end
    end

    def self.all(data_file = './support/markets.csv') #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data_class_instances = [] #start as an empty array. We will fill with instances from our data file.

      data_class_data = CSV.read(data_file)
      data_class_data.each do |row|
        class_instance = self.new( id: row[0].to_i, name: row[1], street_address: row[2], city: row[3], county: row[4], state: row[5], zip: row[6] ) #hash used is different based on type of DataClass
        data_class_instances << class_instance #put it into our collection of instances!
      end
      return data_class_instances
    end


  end
end
