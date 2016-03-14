module FarMar
  class Vendor

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

    def sales(sale_data_file = './support/sales.csv')
      all_sales = Sale.all(sale_data_file)
      matched_sales = all_sales.find_all do |sale|
        sale.vendor_id == id
      end
      return matched_sales
    end

    def products(product_data_file = './support/products.csv')
      all_products = Product.all(product_data_file)
      matched_products = all_products.find_all do |product|
        product.vendor_id == id
      end
      return matched_products
    end


    def markets(market_data_file = './support/markets.csv')
      all_markets = Market.all(market_data_file)
      matched_markets = all_markets.find_all do |market|
        market.id == market_id
      end
      return matched_markets
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
