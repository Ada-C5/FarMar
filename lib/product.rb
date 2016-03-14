require 'csv'

class FarMar::Product

  attr_reader :id, :name, :vendor_id

  PRODUCT_FILE = "support/products.csv"

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    products = []
    CSV.foreach(PRODUCT_FILE) do |row|
      products << FarMar::Product.new(id: row[0].to_i, name: row[1], vendor_id: row[2].to_i)
    end
    return products

  end

  def self.find(id)
    products = self.all
    found_id = nil
    products.each do |product|
      if product.id == id
        found_id = product
      end
    end
    if found_id == nil
      return "ID not found!"
    else
      return found_id
    end
  end
end
