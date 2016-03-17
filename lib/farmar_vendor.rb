module FarMar
  class Vendor < DataClass

    attr_reader :id, :number_of_employees, :market_id

    def initialize(initialization_array)
      @id, @name, @number_of_employees, @market_id = initialization_array

    end

    # def self.sales_with_nil
    # # used this to check for sales that had a nil product id... still not sure what to do with them
    #   all_vendors = self.all
    #   vendors_with_nil_pid = all_vendors.find_all do |vendor|
    #     vendor.market_id == nil
    #   end
    #
    #   vendors_with_nil_pid
    # end

    def revenue
    #we need the zero!!! (otherwise it starts with the first instance)
        total_revenue = sales.reduce(0) do |total, sale|
          sale_amount = (sale.amount).to_f
          total += sale_amount
        end

        total_revenue > 0 ? total_revenue : "This poor vendor made no sales!"

    end

    def sales
      super('./support/sales.csv', FarMar::Sale, id, "vendor_id")
    end

    def products
      super('./support/products.csv', FarMar::Product, id, "vendor_id")
    end

    def market
      super('./support/markets.csv', FarMar::Market, market_id, "id")
    end


    def self.by_market(data_file = './support/vendors.csv', given_market_id)
    # returns a collection of FarMar::Market instance where the value of the market_id field passed given_market_id parameter.
      vendors = self.all(data_file)
      matched_vendors = vendors.find_all do |vendor|
        vendor.market_id == given_market_id
      end
      return matched_vendors
    end

    def self.find(data_file = './support/vendors.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/vendors.csv')
      super(data_file)
    end

  end
end
