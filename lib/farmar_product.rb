require_relative '../farmar'

class FarMar::Product

  def initialize(id, name, vendor_id)
    @id         = id #product ID
    @name       = name
    @vendor_id  = vendor_id
  end

  def self.all
    require "CSV"
    all_products = CSV.read("./support/products.csv", "r")

    all_products.each do |individual_array|
      @id           = individual_array[0]
      @name         = individual_array[1]
      @vendor_id    = individual_array[2]
    end
  end

  def self.find(id)
    require "CSV"
    all_products = CSV.read("./support/products.csv", "r")

    all_products.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        puts "Product ID:    #{individual_array[0]}"
        puts "Product Name:  #{individual_array[1]}"
        puts "Vendor ID:     #{individual_array[2]}"
      end
    end
  end

end
