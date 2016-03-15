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

  # time must be in military time
  # time does not account for user timezone
  # range time1 cannot be before midnight if time2 is after midnight
  def self.between(time1, time2)
    sales = self.all
    time1 = time1.tr('^0-9', '').to_i
    time2 = time2.tr('^0-9', '').to_i
    #range = (time1-time2)
    temp = []
    sales.each do |sale|
      #2013-11-10 01:51:24 -0800
      time = sale.purchase_time
      time = time.split(" ")
      time = time[1]
      time = time.tr('^0-9', '').to_i
      if time.between?(time1, time2)
        temp << sale
      end
    end
    return temp
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