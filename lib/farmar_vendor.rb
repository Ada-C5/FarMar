#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Vendor
  attr_reader :id, :name, :employee_num, :market_id

def initialize(vendor_hash)
  @id = vendor_hash[:id].to_i
  @name = vendor_hash[:name]
  @employee_num = vendor_hash[:employee_num].to_i
  @market_id = vendor_hash[:market_id].to_i
end

def self.all
  all_vendors = CSVHasher.hashify('../support/vendors.csv')
    all_vendors.collect do |n|
      FarMar::Vendor.new(n)
    end
end

def self.find(id)
  id=id.to_i

  all_vendors = FarMar::Vendor.all

  all_vendors.each do |n|
    if n.id == id
      return n
    end
  end
    return nil
end

def market
  all_markets = FarMar::Market.all
  all_markets.select { |m| m.id == @market_id}
end

def self.by_market(market_id)
  market_id = market_id.to_i
  all_vendors = FarMar::Vendor.all
  all_vendors.select { |v| v.market_id == market_id }
end

def products
  all_products = FarMar::Product.all
  all_products.select { |p| p.vendor_id == @id}
end

def sales
  all_sales = FarMar::Sale.all
  all_sales.select { |s| s.vendor_id == @id}
end

def revenue
  vendor_sales = sales
  amount_array = []

  vendor_sales.each do |sale|
    amount_array << sale.amount
  end

amount_array.reduce(0, :+)

end

end
