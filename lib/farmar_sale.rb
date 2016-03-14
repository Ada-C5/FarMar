module FarMar
  class Sale

    attr_reader :id, :vendor_id, :amount

    def initialize(vendor_information)
      @id                  = vendor_information[:id]
      @amount              = vendor_information[:amount] #comes from CSV in cents
      @purchase_time       = vendor_information[:purchase_time]
      @vendor_id           = vendor_information[:vendor_id]
      @product_id          = vendor_information[:product_id]

    end

    def self.find(data_file = './support/sales.csv', id) # returns an instance of Sale where the value of the id field in the CSV matches the passed parameter. Will this be different?  There can be multiple with same ID potentially?
      sales = self.all(data_file)
      sales.each do |sale|
        return sale if sale.id == id
      end
    end

    def self.all(data_file = './support/sales.csv') #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data_class_instances = [] #start as an empty array. We will fill with instances from our data file.

      data_class_data = CSV.read(data_file)
      data_class_data.each do |row|
        class_instance = self.new( id: row[0].to_i, amount: row[1].to_f, purchase_time: DateTime.parse(row[2]), vendor_id: row[3].to_i, product_id: row[4].to_i ) #hash used is different based on type of DataClass
        data_class_instances << class_instance #put it into our collection of instances!
      end
      return data_class_instances
    end

  end
end
