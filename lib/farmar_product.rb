
class FarMar::Product
  attr_reader :product_id, :product_name, :vendor_id

  def initialize(product_hash)
    @product_id = product_hash[:product_id]
    @product_name = product_hash[:product_name]
    @vendor_id = product_hash[:vendor_id]
  end

  # self.all: returns a collection of instances, representing all of the objects described in the CSV

  def self.all
    csv_products_array = []
    CSV.open("./support/products.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_products_array << FarMar::Product.new(product_id: row[0].to_i, product_name: row[1].to_s, vendor_id: row[2].to_i)
      end
      return csv_products_array
    end
  end

  # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

  def self.find(id)
    found = self.all.find_all { |product| product.product_id == id}
    return found[0]
  end

  # self.by_vendor(vendor_id): returns all of the products with the given vendor_id

  def self.by_vendor
    self.all.find_all { |product| product.product_id == @product_id }
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field

  def vendor
    FarMar::Vendor.find(@vendor_id)
  end

  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.

  def sales
    FarMar::Sale.all.find_all { |sale| sale.product_id == @product_id}
  end

  #number_of_sales: returns the number of times this product has been sold.

  def number_of_sales
    number = FarMar::Sale.all.find_all { |sale| sale.product_id == @product_id}
    return number.length
  end
end
