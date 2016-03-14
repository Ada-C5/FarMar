module FarMar
  class Product

    attr_reader :id, :vendor_id

    def initialize(vendor_information)
      @id                  = vendor_information[:id]
      @name                = vendor_information[:name]
      @vendor_id           = vendor_information[:vendor_id]
    end

    def self.find(data_file = './support/products.csv', id) # returns an instance of Product where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      products = self.all(data_file)
      products.each do |product|
        return product if product.id == id
      end
    end

    def self.all(data_file = './support/products.csv') #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data_class_instances = [] #start as an empty array. We will fill with instances from our data file.

      data_class_data = CSV.read(data_file)
      data_class_data.each do |row|
        class_instance = self.new( id: row[0].to_i, name: row[1], vendor_id: row[2].to_i ) #hash used is different based on type of DataClass
        data_class_instances << class_instance #put it into our collection of instances!
      end
      return data_class_instances
    end

  end
end
