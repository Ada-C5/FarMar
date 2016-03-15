#require_relative '../far_mar'

class FarMar::Product
  attr_reader :id, :name, :total_employees, :market_id, :vendor_id

  def initialize(product_info)
    @id              = product_info [ :id ]              # (Fixnum) uniquely identifies the product
    @name            = product_info [ :name ]            # (String) the name of the product (not guaranteed unique)
    @vendor_id       = product_info [ :vendor_id   ] # (Fixnum) a reference to which vendor sells this product
  end

  def self.all
    all_products = []

    products_from_csv = CSV.read("./support/products.csv") # creates an array with each line as element

    products_from_csv.each do |line|
      all_products << self.new(id: line[0].to_i, name: line[1], vendor_id: line[2])
    end
    return all_products
  end

  def self.find(id)
    all_products = self.all

    all_products.each do |product|
      if id.to_i == product.id
        return product
      end
    end
  end

end
