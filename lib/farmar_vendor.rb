module FarMar
  class Vendor < DataClass

    attr_accessor :id, :number_of_employees, :market_id

    def initialize(initialization_array)
      @id, @name, @number_of_employees, @market_id = initialization_array

      #need to convert objects that came through as strings in parallel assignment...
      #other problems with parallel assignment is what if row is incomplete? :(


    end

    def revenue
    #we need the zero!!! (otherwise it starts with the first instance)
        total_revenue = sales.reduce(0) do |total, sale|
          sale_amount = (sale.amount).to_f #this is hacky. fix?
          total += sale_amount
        end
        return total_revenue
    end

    def sales
      super('./support/sales.csv', FarMar::Sale, id, "vendor_id")
    end

    def products
      super('./support/products.csv', FarMar::Product, id, "vendor_id")
    end

    def markets
      super('./support/markets.csv', FarMar::Market, market_id, "id")
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

    def self.all(data_file = './support/vendors.csv')
      super(data_file)
    end

  end
end
