class FarMar::Product

  attr_reader :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    all_products = []
    keys = [:id, :name, :vendor_id]
    product_hash = CSV.read('./support/products.csv').map {|values| Hash[ keys.zip(values) ]}
    product_hash.each do |product|
      all_products << self.new(product)
    end
    return all_products
  end

end
