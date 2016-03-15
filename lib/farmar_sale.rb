module FarMar
  class Sale < DataClass

    attr_reader :id, :vendor_id, :product_id, :amount, :purchase_time

    def initialize(initialization_array)
      @id, @amount, @purchase_time, @vendor_id, @product_id = initialization_array

    end

    def product
      super('./support/products.csv', FarMar::Product, product_id, "id")
    end

    def vendor
      super('./support/vendors.csv', FarMar::Vendor, vendor_id, "id")
    end

    def self.between(beginning_time, end_time)
      # get all the Sale instances
      all_sales = self.all

      #check sale_instance.purchase_time is between our times
      #collect these in an array
      sales_between_times = all_sales.find_all do |sale|
        sale.purchase_time == nil
      end

    end

    def self.find(data_file = './support/sales.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/sales.csv')
      super(data_file)
    end

  end
end
