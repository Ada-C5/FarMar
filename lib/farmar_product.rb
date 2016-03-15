module FarMar
  class Product < DataClass

    attr_reader :id, :vendor_id

    def initialize(initialization_array)
      @id, @name, @vendor_id = initialization_array
    end

    def vendor
      super('./support/products.csv', FarMar::Vendor, vendor_id, "id")
    end

    def number_of_sales
      self.sales.length #idk why I needed to put self. here... but it made the test pass?
    end


    def sales
      super('./support/sales.csv', FarMar::Sale, id, "product_id")
    end

    def self.find(data_file = './support/products.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/products.csv')
      super(data_file)
    end

  end
end
