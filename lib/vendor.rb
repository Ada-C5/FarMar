class FarMar::Vendor
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    csv = FarMar::Market.read_csv("./support/vendors.csv")

    @vendor_id = csv[csv_index][0]
    @name = csv[csv_index][1]
    @no_of_empl = csv[csv_index][2]
    @market_id = csv[csv_index][3]
  end
end
