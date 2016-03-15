class FarMar::Vendor
  attr_reader :vendor_id, :name, :no_of_empl, :market_id

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/vendors.csv"
  VENDOR_CSV = FarMar::Vendor.read_csv(FILE)

  def initialize(csv_index)
    @vendor_id = VENDOR_CSV[csv_index][0].to_i
    @name = VENDOR_CSV[csv_index][1]
    @no_of_empl = VENDOR_CSV[csv_index][2].to_i
    @market_id = VENDOR_CSV[csv_index][3].to_i
  end

  def self.all
    allvendors = []
    VENDOR_CSV.length.times do |index|
      allvendors << FarMar::Vendor.new(index)
    end
    return allvendors
  end

  def self.find(id)
    the_vendor = []
    VENDOR_CSV.each do |vendor|
      if vendor[0].to_i == id.to_i
        the_vendor = vendor
      end
    end
    index = VENDOR_CSV.index(the_vendor)
    return FarMar::Vendor.new(index)
  end

end
