class FarMar::Vendor

  attr_reader :id, :name, :num_of_employees, :market_id

  def initialize(vendor_hash)
    # ID - (Fixnum) uniquely identifies the vendor
    # Name - (String) the name of the vendor (not guaranteed unique)
    # No. of Employees - (Fixnum) How many employees the vendor has at the market
    # Market_id - (Fixnum) a reference to which market the vendor attends

    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @num_of_employees = vendor_hash[:num_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all(path_to_csv)
    vendor_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
      id = row[0]
      name = row[1]
      num_of_employees = row[2]
      market_id = row[3]

      vendor_hash = {id: id, name: name, num_of_employees: num_of_employees, market_id: market_id}
      vendor_list << self.new(vendor_hash)
    end
    vendor_list
  end

  def self.find(id)
    vendors_to_search = FarMar::Vendor.all(FarMar::VENDORS_CSV)
    vendor_to_return = nil

    if id.to_s <= vendors_to_search[vendors_to_search.length-1].id
      vendor_to_return = vendors_to_search[vendors_to_search.find_index {|vendor| vendor.id == id.to_s}]
    end
    
    vendor_to_return
  end

# market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  def market
    FarMar::Market.find(self.market_id)
  end


  # products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  def products
    products_to_search = FarMar::Product.all(FarMar::PRODUCTS_CSV)
    products_to_search.select {|product| product.vendor_id == self.id}
  end

  # sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def sales
    sales_to_search = FarMar::Sale.all(FarMar::SALES_CSV)
    sales_to_search.select {|sale| sale.vendor_id == self.id}
  end

  # revenue: returns the the sum of all of the vendor's sales (in cents)
  def revenue
    # create sales to search
    # search sales for this vendor id
    # leverages sales method
    sales_to_sum = self.sales
    total_revenue = 0

    # sum sales
    sales_to_sum.each do |sale|
      total_revenue += sale.amount.to_i
    end

    # return sum
    return total_revenue
  end

  # self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    vendors_to_search = FarMar::Vendor.all(FarMar::VENDORS_CSV)

    vendors_to_search.select {|vendor| vendor.market_id == market_id.to_s}
  end

end