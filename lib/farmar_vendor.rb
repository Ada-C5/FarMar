require_relative '../far_mar'

class FarMar::Vendor
  attr_reader :id, :name, :number_of_employees, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @number_of_employees = vendor_hash[:number_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    # CSV.read reads the contents of the file into an array of arrays
    all_vendors = CSV.read("./support/vendors.csv")
    # returns an array of instances with attributes created from a hash, representing all of the objects described in the CSV
    all_vendors.collect do |vendor|

      single_vendor_hash = {
        id: vendor[0].to_i,
        name: vendor[1], # needs method to remove "" characters
        number_of_employees: vendor[2],
        market_id: vendor[3].to_i
      }
      FarMar::Vendor.new(single_vendor_hash)
    end
  end

  def self.find(given_id)
    found_vendor = nil
    self.all.each do |vendor|
      if vendor.id == given_id
        found_vendor = vendor
      end
    end
    found_vendor
  end

  def self.by_market(market_id)
    # returns all of the vendors with the given market_id
    self.all.find_all {|vendor| vendor.market_id == market_id }
  end

  def markets
    #returns the FarMar::Market instance that is associated with this vendor
    #using the FarMar::Vendor market_id field
    FarMar::Market.all.find {|market| market.id == market_id}
  end

  def products
    #returns a collection of FarMar::Product instances that are associated by
    # the FarMar::Product vendor_id field.
    FarMar::Product.all.find_all {|product| product.vendor_id == id}
  end

  def sales
    # returns a collection of FarMar::Sale instances that are associated by the
    # vendor_id field.
    FarMar::Sale.all.find_all {|sale| sale.vendor_id == id}
  end

  def revenue
    #returns the sum of all of the vendor's sales (in cents)
    all_sale_amounts = sales.collect do |sale|
      sale.amount
    end
    all_sale_amounts.reduce(0, :+)
  end
end
