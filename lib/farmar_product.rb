require_relative '../farmar'

class FarMar::Product

  def initialize(id, name, vendor_id)
    @id         = id #product ID
    @name       = name
    @vendor_id  = vendor_id
  end

  def self.all
    all_products = CSV.read("./support/products.csv", "r")

    all_products.collect do |individual_array|
      @id           = individual_array[0]
      @name         = individual_array[1]
      @vendor_id    = individual_array[2]

      self.new(@id, @name, @vendor_id)
    end
  end

  def self.find(id)
    all_products = CSV.read("./support/products.csv", "r")

    all_products.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        return self.new(individual_array[0], individual_array[1], individual_array[2])
      end
    end
  end

private
  def self.vendor_products(vendor_id)   #used by the Vendor.products method
    all_products = CSV.read("./support/products.csv", "r")
    product_array = []
    all_products.each do |individual_array|
      if individual_array[2].to_f == vendor_id.to_f
        product = self.new(individual_array[0], individual_array[1], individual_array[2])
        product_array << product
      end
    end
    product_array
  end

end
