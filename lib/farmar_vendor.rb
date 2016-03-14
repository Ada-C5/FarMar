
class FarMar::Vendor

  attr_reader :vendor_id, :vendor_name, :num_of_employees, :market_id

  def initialize(vendor_hash)
    @vendor_id = vendor_hash[:vendor_id]
    @vendor_name = vendor_hash[:vendor_name]
    @num_of_employees = vendor_hash[:num_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.all
    csv_vendors_array = []
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_vendors_array << FarMar::Vendor.new(vendor_id: row[0].to_i, vendor_name: row[1].to_s, num_of_employees: row[2].to_i, market_id: row[3].to_i)
      end
      return csv_vendors_array
    end
  end

  def self.find(id)
    CSV.open("./support/vendors.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == id
          found_account = FarMar::Vendor.new(vendor_id: row[0].to_i, vendor_name: row[1].to_s, num_of_employees: row[2].to_i, market_id: row[3].to_i)
          return [found_account]
        end
      end
    end
  end

  def market(mar_id = @market_id)
    CSV.open("./support/markets.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == mar_id
          found_market = FarMar::Market.new(market_id: row[0].to_i, name: row[1].to_s, address: row[2].to_s, city: row[3].to_s, county: row[4].to_s, state: row[5].to_s, zip: row[6].to_i)
          return found_market
        end
      end
    end
  end

  # products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

  def products(ven_id = @vendor_id)
    CSV.open("./support/products.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[2].to_i == ven_id
          found_products << FarMar::Product.new(product_id: row[0].to_i, product_name: row[1].to_s, vendor_id: row[3].to_i)
          return [found_products]
        end
      end
    end
  end
end



# sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
# revenue: returns the the sum of all of the vendor's sales (in cents)
# self.by_market(market_id): returns all of the vendors with the given market_id
