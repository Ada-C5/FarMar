class FarMar::Product
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    @product_id = read_csv("./support/products.csv")[csv_index][0]
    @name = read_csv("./support/products.csv")[csv_index][1]
    @vendor_id = read_csv("./support/products.csv")[csv_index][2]
  end
end
