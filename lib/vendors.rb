class FarMar::Vendor
  attr_accessor :vendor_id, :vendor_name, :num_employees, :market_id

  def initialize(id, name, employees, market_id)
    @vendor_id = id
    @vendor_name = name
    @num_employees = employees
    @market_id = market_id
  end

  def self.all
    CSV.read('support/vendors.csv').collect { |row| self.new(row[0].to_i,row[1].upcase,row[2],row[3].to_i)}
  end

  def self.find(id)
    FarMar::Vendor.all.each do |vendor|
      if vendor.vendor_id == id.to_i
        return vendor
      end
    end
  end

  def market
    FarMar::Market.all.select { |market| market.market_id == market_id.to_i }
  end

  def products
    FarMar::Product.all.select { |product| product.vendor_id == vendor_id.to_i }
  end

  def sales
    FarMar::Sale.all.select { |sale| sale.vendor_id == vendor_id.to_i }
  end

  def revenue
    FarMar::Sale.all.collect { |sale_info| sale_info.ammount }.reduce(:+)
  end

  def self.by_market(market_id_given)
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id_given.to_i }
  end

  def self.most_revenue(n)
    n = n.to_i
    #returns the top n vendor instances ranked by total revenue
    vendors_hash = FarMar::Sale.all.group_by { |sale| sale.vendor_id }

    ranking = vendors_hash.values.collect do |array_sales_info|
      array_sales_info.map {|sales_info| sales_info.ammount }.reduce(:+)
    end

    vendors_and_revenue = vendors_hash.keys.zip ranking

    vendors_and_revenue = vendors_and_revenue.sort { |a, b| b[1] <=> a[1] }

    vendors_and_revenue = vendors_and_revenue.collect { |pairs| pairs[0] }.first(n)

    vendors_and_revenue.collect {|vendor_id| FarMar::Vendor.find(vendor_id) }
  end

  def self.most_items(n)
    n = n.to_i
    #returns the top n vendor instances ranked by total number of items sold
    vendors_hash = FarMar::Sale.all.group_by { |sale| sale.vendor_id }
    vendors_items = vendors_hash.values.collect {|array_sales_info| array_sales_info.length}
    vendors_and_revenue = vendors_hash.keys.zip vendors_items
    vendors_and_revenue = vendors_and_revenue.sort { |a, b| b[1] <=> a[1] }
    vendors_and_revenue = vendors_and_revenue.collect { |pairs| pairs[0] }.first(n)
    vendors_and_revenue.collect {|vendor_id| FarMar::Vendor.find(vendor_id) }

  end
end
