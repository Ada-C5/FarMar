require_relative '../farmar'

class FarMar::Vendor
  def initialize(vendor_id, vendor_name, employees, market_id)
    @vendor_id    = vendor_id
    @vendor_name  = vendor_name
    @employees    = employees
    @market_id    = market_id
  end

  def self.all
    all_vendors = CSV.read("./support/vendors.csv", "r")

    all_vendors.collect do |individual_array|      #change to collect
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

end #class end
