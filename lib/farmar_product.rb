class FarMar::Product
  attr_reader :name, :vendor_id, :product_id
  def initialize(product_hash) #for all, csv length -1?
    @vendor_id = product_hash[:vid],
    @name = product_hash[:name],
    @product_id = product_hash[:pid]
  end

  def read_csv
    CSV.open('../support/products.csv')
  end

  def self.all
    product_instances = []
    self.pull_from_csv.each do |product|
      product_info = {
        pid: product[0],
        name: product[1],
        vid: product[2]
      }
      new_product = FarMar::Product.new(product_info)
      product_instances << new_product
    end
      product_instances
  end
end
