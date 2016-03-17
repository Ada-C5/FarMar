module FarMar
  class Product < DataClass

    attr_reader :id, :vendor_id

    def initialize(initialization_array)
      @id, @name, @vendor_id = initialization_array
    end

    def vendor
      super('./support/vendors.csv', FarMar::Vendor, vendor_id, "id")
    end

    def number_of_sales
      self.sales.length # self because THIS object needs to respond to the message, .sales
    end

    def sales
      super('./support/sales.csv', FarMar::Sale, id, "product_id")
    end

    def self.by_vendor(data_file = './support/products.csv', given_vendor_id)
    # returns a collection of FarMar::Product instance where the value of the vendor_id field passed given_vendor_id parameter.
      products = self.all(data_file)
      matched_products = products.find_all do |product|
        product.vendor_id == given_vendor_id
      end
      return matched_products
    end

    def self.find(data_file = './support/products.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/products.csv')
      super(data_file)
    end

  end
end
