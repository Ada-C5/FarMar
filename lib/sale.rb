class FarMar::Sale
  attr_accessor :sale_id, :purchase_time, :ven_id, :amount, :prod_id
  FILE = './support/sales.csv'

  def initialize(id, amount, purchase_time, ven_id, prod_id)
    @sale_id = id
    @amount = amount
    @purchase_time = purchase_time
    @ven_id = ven_id
    @prod_id = prod_id
  end

  def self.all
    sales = []
    CSV.foreach(FILE) do |line|
      id = line[0].to_i
      amount = line[1].to_i
      purchase_time = Time.parse(line[2])
      ven_id = line[3].to_i
      prod_id = line[4].to_i
      sales << self.new(id, amount, purchase_time, ven_id, prod_id)
    end
    return sales
  end

  def self.find(id)
    sales = self.all 
    sales.each do |sale|
      return sale if sale.sale_id == id
    end
  end

  # method to find sales that happened in a certain range
  def self.between(start_time, end_time)
    start_time = Time.parse(start_time)
    end_time = Time.parse(end_time)
    self.all.find_all { |sale| (start_time..end_time).include?(sale.purchase_time) }
  end

  # return vendor instance related to sale
  def vendor(ven_id)
    FarMar::Vendor.all.find { |vendor| vendor.ven_id == ven_id }
  end

  # returns product instance associated with sale
  def product(prod_id)
    FarMar::Product.all.find { |product| product.prod_id == prod_id }
  end
end