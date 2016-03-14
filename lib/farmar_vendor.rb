require_relative '../farmar'
require_relative './farmar_market'

class FarMar::Vendor
  def initialize(vendor_id, vendor_name, employees, market_id)
    @vendor_id    = vendor_id
    @vendor_name  = vendor_name
    @employees    = employees
    @market_id    = market_id
  end

  def self.all
    all_vendors = CSV.read("./support/vendors.csv", "r")

    all_vendors.collect do |individual_array|
      @vendor_id    = individual_array[0].to_f
      @vendor_name  = individual_array[1].to_s
      @employees    = individual_array[2]
      @market_id    = individual_array[3]

      self.new(@vendor_id, @vendor_name, @employees, @market_id)
    end
  end

  def self.find(id)
    all_vendors = CSV.read("./support/vendors.csv", "r")

    all_vendors.each do |individual_array|
       individual_array[0].to_f == id.to_f
        return self.new(individual_array[0].to_f, individual_array[1], individual_array[2].to_f, individual_array[3].to_f)
    end
  end

  #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  def self.market(market_id)
    FarMar::Market.find(market_id)
  end
  #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.

  #revenue: returns the the sum of all of the vendor's sales (in cents)
  # self.by_market(market_id): returns all of the vendors with the given market_id




  private
  def self.market_vendors(market_id)
    market_vendors_array = []
    all_vendors = CSV.read("./support/vendors.csv", "r")

    all_vendors.map do |individual_array|
      if individual_array[3].to_f == market_id.to_f
      market_vendors_array << individual_array
      end
    end
    return market_vendors_array
  end



end #class end
