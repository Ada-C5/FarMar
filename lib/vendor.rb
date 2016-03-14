class FarMar::Vendor
  def read_csv(file)
    CSV.read(file, 'r')
  end

  def initialize(csv_index)
    @vendor_id = read_csv("./support/vendors.csv")[csv_index][0]
    @name = read_csv("./support/vendors.csv")[csv_index][1]
    @no_of_empl = read_csv("./support/vendors.csv")[csv_index][2]
    @market_id = read_csv("./support/vendors.csv")[csv_index][3]
  end
end
