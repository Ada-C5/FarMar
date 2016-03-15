class FarMar::Sale
  attr_reader :sale_id, :amount, :sale_time, :vendor_id, :product_id
  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/sales.csv"
  SALE_CSV = FarMar::Sale.read_csv(FILE)

  def initialize(sale_id)
    sale_id -= 1
    @sale_id = SALE_CSV[sale_id][0].to_i
    @amount = SALE_CSV[sale_id][1]
    @sale_time = SALE_CSV[sale_id][2]
    @vendor_id = SALE_CSV[sale_id][3].to_i
    @product_id = SALE_CSV[sale_id][4].to_i
  end

  def self.all
    allsales = []
    SALE_CSV.length.times do |index|
      allsales << FarMar::Sale.new(index)
    end
    return allsales
  end

  def self.find(sale_id)
    return FarMar::Sale.new(sale_id)
  end

  def vendor
    sale = FarMar::Sale.find(@sale_id)
    sale.vendor_id
    FarMar::Vendor.find(vendor_id)
  end
end
