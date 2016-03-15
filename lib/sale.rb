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
      purchase_time = line[2]
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
end