class FarMar::Product
  attr_reader :name, :vendor_id, :product_id
  def initialize(line) #for all, csv length -1?
    @product_id = line[0].to_i
    @name = line[1].to_s
    @vendor_id = line[2].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/products.csv')
  end

  def self.all
    product_instances = {}
    self.pull_from_csv.each do |line|
      product_instances[line[0]] = FarMar::Product.new(line)
    end
      product_instances
  end

  def self.find(id) #find by product id
    self.pull_from_csv.each do |product_instance|
      if product_instance[0].to_i == id.to_i
        return FarMar::Product.new(product_instance)
      end
    end
    return "no instance found"
  end
end
