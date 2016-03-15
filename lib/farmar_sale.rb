module FarMar
  class Sale < DataClass

    attr_reader :id, :vendor_id, :amount

    def initialize(initialization_array)
      @id, @amount, @purchase_time, @vendor_id, @product_id = initialization_array

    end

    def self.find(data_file = './support/sales.csv', id) # returns an instance of Sale where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      sales = self.all(data_file)
      sales.each do |sale|
        return sale if sale.id == id
      end
    end

    def self.all(data_file = './support/sales.csv')
      super(data_file)
    end

  end
end
