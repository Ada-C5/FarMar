class FarMar::Vendor

  def initialize(id, name, num_of_employees, mar_id)
    @ven_id = id
    @name = name
    @num_of_employees = num_of_employees
    @mar_id = mar_id
  end

  def self.all
  end

  def self.find(id)
  end  
end