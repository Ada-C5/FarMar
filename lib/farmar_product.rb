class FarMar::Product

  attr_reader :product_id, :name, :vendor_id
  # self.all: returns a collection of instances, representing all of the objects described in the CSV
  def initialize(product_info)
    @product_id = product_info[:product_id].to_i
    @name = product_info[:name]
    @vendor_id = product_info[:vendor_id].to_i
  end

  def self.all
    all_product_info = []
    CSV.open("./support/products.csv", 'r') do |csv|
      csv.read.each do |line|
        all_product_info.push(self.new(product_id: line[0], name: line[1], vendor_id: line[2]))
      end
    end
    return all_product_info
  end


  def self.find(id)
    all_products = self.all
    all_products.each do |product|
      if product.product_id == id
        return product
      end
    end
    nil
  end



end



# 1. ID - (Fixnum) uniquely identifies the product
# 2. Name - (String) the name of the product (not guaranteed unique)
# 3. Vendor_id - (Fixnum) a reference to which vendor sells this product
