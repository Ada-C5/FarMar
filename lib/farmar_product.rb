# require_relative '../far_mar'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_products = CSV.read("./support/products.csv")
    # returns an array of instances with attributes created from a hash, representing all of the objects described in the CSV
    all_products.collect do |product|

      single_product_hash = {
        id: product[0],
        name: product[1],
        number_of_employees: product[2],
        market_id: product[3]
      }
      FarMar::Product.new(single_product_hash)
    end
  end

  end
end
