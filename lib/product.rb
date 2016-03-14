class FarMar::Product
  attr_reader 
  attr_accessor :name, :prod_id
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
      id = line[0].to_i
      name = line[1]
      ven_id = line[2].to_i
      #TEST OUTPUT return "#{id} #{name} #{ven_id}"
      products << self.new(id, name, ven_id)
    end
    return products
  end

  def self.find(id)
    sought_product = nil
    temp = []
    products = self.all
    products.each do |product|
      if product.prod_id == id
        sought_product = product
        return sought_product.name
      end
    end
  end
end