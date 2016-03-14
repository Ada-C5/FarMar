class FarMar::Product
  attr_accessor :product_id, :product_name, :vendor_id

  def initialize(id, name, vendor_id)
    @product_id = id
    @product_name = name
    @vendor_id = vendor_id

  end

  def self.all
    csv_array = CSV.read('support/products.csv')
    @all_products = csv_array.collect do |row|
     self.new(row[0].to_i,row[1],row[2].to_i)
    end
  end


  def self.find(id)
    FarMar::Product.all
    @all_products.each do |product|
      if product.product_id == id.to_i
        return product
      end
    end
  end
end
