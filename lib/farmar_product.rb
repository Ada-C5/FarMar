# lib/farmar_product.rb
class FarMar::Product
  attr_reader :id, :name, :vendor_id
  def initialize(hash)
    @id = hash[:id].to_i
    @name = hash[:name]
    @vendor_id = hash[:vendor_id].to_i
  end

  # ID - (Fixnum) uniquely identifies the product
  # Name - (String) the name of the product (not guaranteed unique)
  # Vendor_id - (Fixnum) a reference to which vendor sells this product

  # creates instances (8193) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    products_info = []
    CSV.foreach("support/products.csv") do |row|
      info = self.new(id: row[0], name: row[1], vendor_id: row[2])
      products_info << info
    end
    return products_info
  end

  def self.find(id)
    self.all.each do |instance|
      if instance.id == id
        return instance
      end
    end
  end

  def vendor
    FarMar::Vendor.all.find {|instance| instance.id == vendor_id}
  end

  # returns all of the sales that match the id
  def sales
    FarMar::Sale.all.find_all {|instance| instance.product_id == id}
  end

  def number_of_sales
    sales.length
  end
end
