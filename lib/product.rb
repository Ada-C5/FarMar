#require_relative '../far_mar'

class FarMar::Product

  @@products = nil

  attr_reader :id, :name, :vendor_id

  def initialize(product_info)
    @id              = product_info [ :id ].to_i             # (Fixnum) uniquely identifies the product
    @name            = product_info [ :name ]            # (String) the name of the product (not guaranteed unique)
    @vendor_id       = product_info [ :vendor_id   ].to_i # (Fixnum) a reference to which vendor sells this product
  end

  def self.all
    @@products ||= begin
      products_from_csv = CSV.read("./support/products.csv") # creates an array with each line as element
      products_from_csv.map {|line| self.new(id: line[0].to_i, name: line[1], vendor_id: line[2].to_i)}
    end
  end

  def self.find(id)
    self.all.select { |product| id.to_i == product.id }[0]
  end

  def self.by_vendor(vendor_id)
    self.all.select {|product| vendor_id == product.vendor_id}
  end

  def vendor
    FarMar::Vendor.all.select {|vendor| vendor.id == vendor_id}
  end

  def sales
    FarMar::Sale.all.select {|sale| sale.product_id.to_i == id.to_i}
  end

  def number_of_sales
    sales.length
  end

end
