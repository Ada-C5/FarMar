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
      # we will probably get user input as a string - need to parse.
      date1 = Date.parse(beginning_time)
      date2 = Date.parse(end_time)

      # get all the Sale instances
      all_sales = self.all

      sales_between_times = all_sales.find_all do |sale|
        sale_date = Date.parse(sale.purchase_time)
        (date2..date1).cover?(sale_date)
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
