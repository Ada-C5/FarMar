class FarMar::Sale
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    csv = FarMar::Market.read_csv("./support/sales.csv")

    @sale_id = csv[csv_index][0]
    @amount = csv[csv_index][1]
    @sales_time = csv[csv_index][2]
    @vendor_id = csv[csv_index][3]
    @product_id = csv[csv_index][4]

  end
end
