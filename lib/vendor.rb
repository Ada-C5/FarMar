class FarMar::Vendor

  attr_reader :id, :name, :no_of_employees, :market_id

  def initialize(info={})
    @id = info[:id].to_i
    @name = info[:name]
    @no_of_employees = info[:no_of_employees].to_i
    @market_id = info[:market_id].to_i
  end

  def self.all(file = "./support/vendors.csv")
    # vendor_array = []
    vendor = CSV.read(file)
    vendor.map do |line|
      hash = {
        :id => line[0],
        :name => line[1],
        :no_of_employees => line[2],
        :market_id => line[3]
      }
      # vendor_array <<
      FarMar::Vendor.new(hash)
    end
    # return vendor_array
  end

  def self.find(id)
    vendors = self.all
    vendors.detect do |found_vendor|
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
    market_id = @market_id#self.market_id
    return FarMar::Market.find(market_id)
    #--find market by vendor_id--
  end

  def products
    vendor_id = @id#self.id
    FarMar::Product.by_vendor(vendor_id)
  end

  def sales
    vendor_id = @id#self.id
    return FarMar::Sale.by_vendor(vendor_id)
  end

  def revenue
    sales = self.sales #self is the instance this was called with
    total_amount = sales.inject(0) { |sum, sale|
      sum + sale.amount
    }
    return total_amount
    #array.inject(0){|sum,x| sum + x }
  end

end
