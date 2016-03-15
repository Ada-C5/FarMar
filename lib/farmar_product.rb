module FarMar
  class Product < DataClass

    attr_reader :id, :vendor_id

    def initialize(initialization_array)
      @id, @name, @vendor_id = initialization_array
    end

    def self.find(data_file = './support/products.csv', id)
      super(data_file, id)
    end

    def self.all(data_file = './support/products.csv')
      super(data_file)
    end

  end
end
