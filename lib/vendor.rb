class FarMar::Vendor
  attr_accessor :name, :ven_id, :mar_id
  FILE = './support/vendors.csv'

  def initialize(id, name, num_of_employees, mar_id)
    @ven_id = id
    @name = name
    @num_of_employees = num_of_employees
    @mar_id = mar_id
  end

  # return instances from csv information
  def self.all
    vendors = []
    CSV.foreach(FILE) do |line|
      id = line[0].to_i
      name = line[1]
      num_of_employees = line[2].to_i
      mar_id = line[3].to_i
      vendors << self.new(id, name, num_of_employees, mar_id)
    end
    return vendors
  end

  # return one vendor with a specific id
  def self.find(id)
    vendors = self.all 
    vendors.each do |vendor|
      return vendor if vendor.ven_id == id
    end
  end  

  # returns instance of market related to this vendor
  def self.market(mar_id)
    markets = FarMar::Markets.all
    markets.collect{ |market| market.id == mar_id}
    end

end