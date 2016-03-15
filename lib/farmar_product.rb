module FarMar
  class Product < DataClass

    attr_reader :id, :vendor_id

    def initialize(initialization_array)
      @id, @name, @vendor_id = initialization_array
    end

    def self.find(data_file = './support/products.csv', id) # returns an instance of Product where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      products = self.all(data_file)
      products.each do |product|
        return product if product.id == id
      end
    end

    def self.all(data_file = './support/products.csv')
      super(data_file)
    end

  end
end
