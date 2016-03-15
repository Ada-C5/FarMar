class FarMar::Product

  attr_reader :id, :name, :vendor_id

  def initialize(info={})
    @id = info[:id].to_i
    @name = info[:name]
    @vendor_id = info[:vendor_id].to_i
  end

  def self.all(file = "./support/products.csv")
    product_array = []
    product = CSV.read(file)
    product.map do |line|
      hash = {
        :id => line[0],
        :name => line[1],
        :vendor_id => line[2]
      }
      product_array << FarMar::Product.new(hash)
    end
    return product_array
  end

  def self.find(id)
    products = self.all
    products.each do |found_product|
      return found_product if id == found_product.id
    end
    return nil
  end

end
