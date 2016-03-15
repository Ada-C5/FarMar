#get rid of ln2 after done with IRB testing
# require_relative '../far_mar.rb'

class FarMar::Product
  attr_reader :id, :name, :vendor_id

def initialize(product_hash)
  @id = product_hash[:id]
  @name = product_hash[:name]
  @vendor_id = product_hash[:vendor_id]
end

  def self.all
    all_products = CSVHasher.hashify('./support/products.csv')
      all_products.collect do |n|
        FarMar::Product.new(n)
      end
  end

  def self.find(id)
    id=id.to_s

    all_products = FarMar::Product.all

    all_products.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

end
