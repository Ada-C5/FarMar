class FarMar::Product
  attr_reader :name, :prod_id, :ven_id
  #csv with product info
  FILE = './support/products.csv'

  def initialize(id, name, ven_id)
    @prod_id = id
    @name = name
    @ven_id = ven_id  
  end

  # make an array of product instances from CSV
  def self.all
    products = []
    CSV.foreach(FILE) do |line|
      products << self.new(line[0].to_i, line[1], line[2].to_i)
    end
    return products
  end

  # return an instance with same id
  def self.find(id)
    self.all.find { |product| product.prod_id == id }
  end

  # returns all products sold by certain vendor id
  def self.by_vendor(vendor_id)
    self.all.select { |product| product.ven_id == vendor_id}
  end

  # return vendor instance associated with product/vendor_id
  def vendor(vendor_id)
    FarMar::Vendor.all.find { |vendor| vendor.ven_id == vendor_id}
  end

  # returns collection of sale instances
  def sales(product_id)
    FarMar::Sale.all.select { |sale| sale.prod_id == product_id}
  end

    # returns the number of times this product has been sold
    def number_of_sales(product_id)
      sales(product_id).length
    end
end