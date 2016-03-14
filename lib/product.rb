class FarMar::Product
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    csv = FarMar::Market.read_csv("./support/products.csv")

    @product_id = csv[csv_index][0]
    @name = csv[csv_index][1]
    @vendor_id = csv[csv_index][2]
  end
end
