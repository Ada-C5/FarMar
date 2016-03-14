class FarMar::Vendor
  attr_accessor :name, :ven_id
  FILE = './support/vendors.csv'

  def initialize(id, name, num_of_employees, mar_id)
    @ven_id = id
    @name = name
    @num_of_employees = num_of_employees
    @mar_id = mar_id
  end

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

  def self.find(id)
    vendors = self.all 
    vendors.each do |vendor|
      if vendor.ven_id == id
        return vendor
      end
    end
  end  
end