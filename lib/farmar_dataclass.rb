module FarMar
  class DataClass

    def initialize
    end

    def vendors(data_file, data_class) #from market
      all_vendors = data_class.all(data_file)
      matched_vendors = all_vendors.find_all do |vendor|
        vendor.market_id == id
      end
      return matched_vendors
    end

    def markets(data_file, data_class) #from vendor
      all_markets = data_class.all(data_file)
      matched_markets = all_markets.find_all do |market|
        market.id == market_id
      end
      return matched_markets
    end

    def products(data_file, data_class) #from vendor
      all_products = data_class.all(data_file)
      matched_products = all_products.find_all do |product|
        product.vendor_id == id
      end
      return matched_products
    end

    def sales(data_file, data_class) #from vendor
      all_sales = data_class.all(data_file)
      matched_sales = all_sales.find_all do |sale|
        sale.vendor_id == id
      end
      return matched_sales
    end

=begin this will be for later - optional.
    def self.all(data_file) #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data_class_instances = [] #start as an empty array. We will fill with instances from our data file.

      data_class_data = CSV.read(data_file)
      data_class_data.each do |row|
        class_instance = self.new( id: row[0].to_i, name: row[1], street_address: row[2], city: row[3], county: row[4], state: row[5], zip: row[6] ) #hash used is different based on type of DataClass
        data_class_instances << class_instance #put it into our collection of instances!
      end
      return data_class_instances
    end
=end

  end
end
