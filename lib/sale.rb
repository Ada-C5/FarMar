class FarMar::Sale < FarMar::FarMarClass
  attr_reader :id, :purchase_time, :vendor_id, :amount, :product_id
  FILE = './support/sales.csv'

  def initialize(id, amount, purchase_time, ven_id, prod_id)
    @id = id.to_i
    # round sales amounts 
    @amount = amount.to_i
    @purchase_time = Time.parse(purchase_time)
    @vendor_id = ven_id.to_i
    @product_id = prod_id.to_i
  end

  # method to find sales that happened in a certain range
  def self.between(start_time, end_time)
    # make new time instances with start/end time and use them as a range to search
    self.all.find_all { |sale| (Time.parse(start_time)..Time.parse(end_time)).include?(sale.purchase_time) }
  end

  # return vendor instance related to sale
  def vendor(vendor_id)
    FarMar::Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  # returns product instance associated with sale
  def product(product_id)
    FarMar::Product.all.find { |product| product.id == product_id }
  end
end