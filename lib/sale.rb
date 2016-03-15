class FarMar::Sale
  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/sales.csv"
  SALE_CSV = FarMar::Sale.read_csv(FILE)

  def initialize(csv_index)
    @sale_id = SALE_CSV[csv_index][0].to_i
    @amount = SALE_CSV[csv_index][1]
    @sales_time = SALE_CSV[csv_index][2]
    @vendor_id = SALE_CSV[csv_index][3].to_i
    @product_id = SALE_CSV[csv_index][4].to_i
  end

  def self.all
    allsales = []
    SALE_CSV.length.times do |index|
      allsales << FarMar::Sale.new(index)
    end
    return allsales
  end
end
