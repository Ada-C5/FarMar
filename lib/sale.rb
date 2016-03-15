
class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount].to_f
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    all_sales = []
    CSV.foreach("support/sales.csv", "r") do |line|
      all_sales << self.new({:id => line[0], :amount => line[1], :purchase_time => line[2], :vendor_id => line[3], :product_id => line[4]})
    end
    return all_sales
  end

  def self.find(id)
    self.all.each do |sale_inst|
      if sale_inst.id.to_s == id.to_s
        return sale_inst
      end
    end
    return false
  end

end
