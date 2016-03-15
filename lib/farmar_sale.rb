module FarMar
  class Sale < DataClass

    attr_reader :id, :vendor_id, :product_id, :amount

    def initialize(initialization_array)
      @id, @amount, @purchase_time, @vendor_id, @product_id = initialization_array

    end

    def vendor
      super('./support/vendors.csv', FarMar::Vendor, vendor_id, "id")
    end

    def self.find(data_file = './support/sales.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/sales.csv')
      super(data_file)
    end

  end
end
