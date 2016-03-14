class FarMar::Sale

  def initialize(id, amount, purchase_time, ven_id, prod_id)
    @sale_id = id
    @amount = amount
    @purchase_time = purchase_time
    @ven_id = ven_id
    @prod_id = prod_id
  end

  def self.all
  end

  def self.find(id)
  end  
end