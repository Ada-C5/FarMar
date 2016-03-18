
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
      all_sales << self.new({:id => line[0], :amount => line[1], :purchase_time => Time.parse(line[2]), :vendor_id => line[3], :product_id => line[4]})
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

  def vendor
    # Returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
    FarMar::Vendor.all.find { |vendor| vendor.id == @vendor_id}
  end

  def product
    # Returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
    FarMar::Product.all.find { |product| product.id == @product_id }
  end

  def self.between(beginning_time, end_time)
    # Returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
    begins = Time.parse(beginning_time)
    ends = Time.parse(end_time)
    return self.all.find_all { |sale| (begins..ends).cover?(sale.purchase_time) }
  end

  
end
