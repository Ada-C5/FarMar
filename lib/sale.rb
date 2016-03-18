class FarMar::Sale
  attr_reader :id, :purchase_time, :vendor_id, :amount, :product_id
  FILE = './support/sales.csv'

  def initialize(id, amount, purchase_time, ven_id, prod_id)
    @id = id
    # round sales amounts 
    @amount = amount.round
    @purchase_time = purchase_time
    @vendor_id = ven_id
    @product_id = prod_id
  end

  def self.all
    sales = []
    CSV.foreach(FILE) do |line|
      sales << self.new(line[0].to_i, line[1].to_i, Time.parse(line[2]), line[3].to_i, line[4].to_i)
    end
    return sales
  end

  def self.find(id)
    self.all.find { |sale| sale.id == id }
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