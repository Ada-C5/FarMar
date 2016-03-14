class FarMar::Vendor
  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/vendors.csv"
  VENDOR_CSV = FarMar::Vendor.read_csv(FILE)

  def initialize(csv_index)
    @vendor_id = VENDOR_CSV[csv_index][0]
    @name = VENDOR_CSV[csv_index][1]
    @no_of_empl = VENDOR_CSV[csv_index][2]
    @market_id = VENDOR_CSV[csv_index][3]
  end

  def self.all
    allvendors = []
    VENDOR_CSV.length.times do |index|
      allvendors << FarMar::Vendor.new(index)
    end
    return allvendors
  end
end
