class FarMar::Product < FarMar::FarMarClass
  attr_reader :name, :id, :vendor_id
  #csv with product info
  FILE = './support/products.csv'

  def initialize(id, name, ven_id)
    @id = id.to_i
    @name = name
    @vendor_id = ven_id.to_i  
  end

  # returns all products sold by certain vendor id
  def self.by_vendor(vendor_id)
    self.all.select { |product| product.vendor_id == vendor_id}
  end

  # return vendor instance associated with product/vendor_id
  def vendor(vendor_id)
    FarMar::Vendor.all.find { |vendor| vendor.id == vendor_id}
  end

  # returns collection of sale instances
  def sales(product_id)
    FarMar::Sale.all.select { |sale| sale.product_id == product_id}
  end

  # returns the number of times this product has been sold
  def number_of_sales(product_id)
    sales(product_id).length
  end

  # returns top ten product instances by total revenue
  # def self.most_revenue(n)
  #   all_products = []
  #   self.all.each do |product|
  #     total = 0
  #     sales = product.sales(product.id)
  #     sales.each do |sale|
  #       total += sale.amount
  #     end
  #     all_products << total
  #   end
  #   return all_products.sort[0..n] 
  # end
  
end