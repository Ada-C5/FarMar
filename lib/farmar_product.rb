
class FarMar::Product
  attr_reader :product_id, :product_name, :vendor_id

  def initialize(product_hash)
    @product_id = product_hash[:product_id]
    @product_name = product_hash[:product_name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.all
    csv_products_array = []
    CSV.open("./support/products.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_products_array << FarMar::Product.new(product_id: row[0].to_i, product_name: row[1].to_s, vendor_id: row[3].to_i)
      end
      return csv_products_array
    end
  end

  def self.find(id)
    CSV.open("./support/products.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == id
          found_account = FarMar::Product.new(product_id: row[0].to_i, product_name: row[1].to_s, vendor_id: row[3].to_i)
          return [found_account]
        end
      end
    end
  end
end
