class FarMar::Sale
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    @sale_id = read_csv("./support/sales.csv")[csv_index][0]
    @amount = read_csv("./support/sales.csv")[csv_index][1]
    @sales_time = read_csv("./support/sales.csv")[csv_index][2]
    @vendor_id = read_csv("./support/sales.csv")[csv_index][3]
    @product_id = read_csv("./support/sales.csv")[csv_index][4]

  end
end
