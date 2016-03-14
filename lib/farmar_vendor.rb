module FarMar
  class Vendor < DataClass

    attr_reader :id, :market_id

    def initialize(vendor_information)
      @id                  = vendor_information[:id]
      @name                = vendor_information[:name]
      @number_of_employees = vendor_information[:street_address]
      @market_id           = vendor_information[:market_id]

    end

    def revenue
    #we need the zero!!! (otherwise it starts with the first instance)
        total_revenue = sales.reduce(0) do |total, sale|
          sale_amount = sale.amount
          total += sale_amount
        end
        return total_revenue
    end

    def sales
      super('./support/sales.csv', FarMar::Sale)
    end

    def products
      super('./support/products.csv', FarMar::Product)
    end


    def markets(market_data_file = './support/markets.csv')
      super('./support/markets.csv', FarMar::Market)
    end

    def self.by_market(data_file = './support/vendors.csv', given_market_id)
      vendors = self.all(data_file)
      matched_vendors = vendors.find_all do |vendor|
        vendor.market_id == given_market_id
      end
      return matched_vendors
    end

    def self.find(data_file = './support/vendors.csv', id) # returns an instance of Sale where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      vendors = self.all(data_file)
      vendors.each do |vendor|
        return vendor if vendor.id == id
      end
    end

    def self.all(data_file = './support/vendors.csv') #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data_class_instances = [] #start as an empty array. We will fill with instances from our data file.

      data_class_data = CSV.read(data_file)
      data_class_data.each do |row|
        class_instance = self.new( id: row[0].to_i, name: row[1], number_of_employees: row[2].to_i, market_id: row[3].to_i ) #hash used is different based on type of DataClass
        data_class_instances << class_instance #put it into our collection of instances!
      end
      return data_class_instances
    end

  end
end
