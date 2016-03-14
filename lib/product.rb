#require_relative '../far_mar'

class FarMar::Product
  attr_reader

  def initialize(product_info)
    @id              = product_info [ :id ]              # (Fixnum) uniquely identifies the vendor
    @name            = product_info [ :name ]            # (String) the name of the vendor (not guaranteed unique)
    @total_employees = product_info [ :total_employees ] # (Fixnum) How many employees the vendor has at the market
    @market_id       = product_info [ :market_id ]       # (Fixnum) a reference to which market the vendor attends
  end

  def self.all
    all_products = []

    products_from_csv = CSV.read("./support/products.csv") # creates an array with each line as element

    products_from_csv.each do |line|
      all_products << self.new(id: line[0], name: line[1], total_employees: line[2], market_id: line[3])
    end
    return all_products
  end

end
