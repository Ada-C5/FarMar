class FarMar::Product
  FILENAME = "./support/products.csv"
  attr_reader :id, :name, :vendor_id
  def initialize(product_data)
    @id = product_data[:id].to_i #fixnum
    @name = product_data[:name] #string
    @vendor_id = product_data[:vendor_id].to_i #fixnum
  end

  def self.all # self is the class and all is the method
    products_collection = []
    CSV.open(FILENAME, "r") do |csv|
    csv.read.each do |line|
      products_collection << self.new( id: line[0], name: line[1], vendor_id: line[2] )
    end
    end
    return products_collection
  end

  def self.find(id)
    all_products = self.all
    all_products.each do |product|
      if market.id == id
      end
      return product #an instance
    end
  end

end
