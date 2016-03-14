
class FarMar::Vendor
  attr_reader

  def initialize(id, name, num_employees, market_id)
    @id = id
    @name = name
    @num_employees = num_employees
    @market_id = market_id
  end

end
