
class FarMar::Vendor

  attr_reader :vendor_id, :vendor_name, :num_of_employees, :market_id

  def initialize(vendor_hash)
    @vendor_id = vendor_hash[:vendor_id]
    @vendor_name = vendor_hash[:vendor_name]
    @num_of_employees = vendor_hash[:num_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  # self.all: returns a collection of instances, representing all of the objects described in the CSV

  def self.all
    csv_vendors_array = []
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_vendors_array << FarMar::Vendor.new(vendor_id: row[0].to_i, vendor_name: row[1].to_s, num_of_employees: row[2].to_i, market_id: row[3].to_i)
      end
      return csv_vendors_array
    end
  end

  # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

  def self.find(id)
    found = self.all.find_all { |vendor| vendor.vendor_id == id}
    return found[0]
  end

  # self.by_market(market_id): returns all of the vendors with the given market_id

  def self.by_market(this_market_id)
    self.all.find_all { |vendor| vendor.market_id == this_market_id}
  end

  #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field

  def market(mar_id)
    FarMar::Market.find(mar_id)
  end

  # products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

  def products(ven_id)
    FarMar::Product.all.find_all { |product| product.vendor_id == ven_id }
  end

  # sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.

  def sales(ven_id)
    FarMar::Sale.all.find_all { |sale_item| sale_item.vendor_id == ven_id }
  end

  # revenue: returns the the sum of all of the vendor's sales (in cents)

  def revenue
    vend_id = @vendor_id
    found_sale_items = self.sales(vend_id)
    total_revenue = 0
    found_sale_items.each do |sale|
      total_revenue += sale.amount
    end
    return total_revenue
  end
end
