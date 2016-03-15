
class FarMar::Vendor
  attr_reader :id, :name, :num_employees, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_employees = vendor_hash[:num_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    all_vendors = []
    CSV.foreach("support/vendors.csv", "r") do |line|
      all_vendors << self.new({:id => line[0], :name => line[1], :num_employees => line[2], :market_id => line[3]})
    end
    return all_vendors
  end

  def self.find(id)
    self.all.each do |vendor_inst|
      if vendor_inst.id.to_s == id.to_s
        return vendor_inst
      end
    end
    return false
  end

  def market
    # Returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
    FarMar::Market.all.find { |market| market.id == @market_id }
  end

  def products
    # Returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field
    FarMar::Product.all.find_all { |product| product.vendor_id == @id}
  end

  def sales
    # Returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    FarMar::Sale.all.find_all { |sale| sale.vendor_id == @id}
  end

  def revenue
    # Returns the the sum of all of the vendor's sales (in cents)
    this_vendor_sales = FarMar::Sale.all.find_all { |sale| sale.vendor_id == @id}
    total = 0
    this_vendor_sales.each do |a_sale|
      total = total + a_sale.amount
    end
    return total
  end

  def self.by_market(this_market_id)
    #Returns an array with all of the vendors with the given market_id
    self.all.find_all { |vendor| vendor.market_id.to_s == this_market_id.to_s }
  end

end
