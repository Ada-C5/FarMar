class FarMar::Vendor

  attr_reader :id, :name, :no_of_employees, :market_id

  def initialize(info={})
    @id = info[:id].to_i
    @name = info[:name]
    @no_of_employees = info[:no_of_employees].to_i
    @market_id = info[:market_id].to_i
  end

  def self.all(file = "./support/vendors.csv")
    vendor_array = []
    vendor = CSV.read(file)
    vendor.map do |line|
      hash = {
        :id => line[0],
        :name => line[1],
        :no_of_employees => line[2],
        :market_id => line[3]
      }
      vendor_array << FarMar::Vendor.new(hash)
    end
    return vendor_array
  end

  def self.find(id)
    vendors = self.all
    vendors.each do |found_vendor|
      return found_vendor if id == found_vendor.id
    end
    return nil
  end

  def self.by_market(market_id)
    vend = []
    vendors = self.all
    vendors.each do |found_vendor|
      vend << found_vendor if market_id == found_vendor.market_id
    end
    return vend
  end

  def market
    vendor_id = self.id
    FarMar::Market.find(vendor_id)
    #--find market by vendor_id--
  end

  def products
    vendor_id = self.id
    FarMar::Product.by_vendor(vendor_id)
  end

end
