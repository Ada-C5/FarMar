#require_relative '../far_mar'

class FarMar::Product

  CSV_FILE = "./support/products.csv"

  @@products = nil

  attr_reader :id, :name, :vendor_id

  def initialize(product_info)
    @id, @name, @vendor_id = product_info
    @id = @id.to_i
    @vendor_id = @vendor_id.to_i

  end

  def self.all(file = CSV_FILE)
    @@products ||= begin
      products_from_csv = CSV.read(file) # creates an array with each line as element
      products_from_csv.map {|line| self.new(line)}
    end
  end

  def self.find(id)
    self.all.select { |product| product.id == id.to_i }.first
  end

  def self.by_vendor(vendor_id)
    self.all.select {|product| product.vendor_id == vendor_id.to_i}
  end

  def vendor
    FarMar::Vendor.all.select {|vendor| vendor.id == vendor_id}
  end

  def sales
    FarMar::Sale.all.select {|sale| sale.product_id == id}
  end

  def number_of_sales
    sales.length
  end

end
