class FarMar::Vendor
  attr_reader :vendor_id, :name, :no_of_empl, :market_id

  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/vendors.csv"
  VENDOR_CSV = FarMar::Vendor.read_csv(FILE)

  def initialize(vendor_id)
    vendor_id -= 1
    @vendor_id = VENDOR_CSV[vendor_id][0].to_i
    @name = VENDOR_CSV[vendor_id][1]
    @no_of_empl = VENDOR_CSV[vendor_id][2].to_i
    @market_id = VENDOR_CSV[vendor_id][3].to_i
  end

  def self.all
    allvendors = []
    VENDOR_CSV.length.times do |index|
      allvendors << FarMar::Vendor.new(index)
    end
    return allvendors
  end

  def self.find(vendor_id)
    return FarMar::Vendor.new(vendor_id)
  end

  def market
    return FarMar::Market.find(@market_id)
  end

  # def products
  #   vendor_products = []
  #   products = FarMar::Product::PRODUCT_CSV.find_all { |product| product.last.to_i == @vendor_id }
  #   products.each do |product|
  #     vendor_products << FarMar::Product.new(product[0].to_i)
  #   end
  #   return vendor_products
  # end

  # products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
  def products
    products = FarMar::Product.all
    products.find_all { |product| product.vendor_id == @vendor_id }
  end

  #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  # def sales
  #   vendor_sales = []
  #   sales = FarMar::Sale::SALE_CSV.find_all { |sale| sale.last.to_i == vendor_id }
  #   sales.each do |sale|
  #     vendor_sales << FarMar::Sale.new(sales.first[0].to_i)
  #   end
  #   return vendor_sales
  # end

  def sales
    sales = FarMar::Sale.all
    sales.find_all { |sale| sale.vendor_id == @vendor_id }
  end

  # def revenue
  #   vendor_sales = []
  #   sales = FarMar::Sale::SALE_CSV.find_all { |sale| sale.last.to_i == vendor_id }
  #   sales.each do |sale|
  #     sale = FarMar::Sale.new(sales.first[0].to_i)
  #     vendor_sales << sale.amount.to_i
  #   end
  #   return vendor_sales.reduce(0, :+)
  # end

  def revenue
    revenue = []
    sales = self.sales
    sales.each do |sale|
      revenue << sale.amount * 100
    end
    revenue.reduce(0, :+)
  end

  # self.by_market(market_id): returns all of the vendors with the given market_id
  def self.by_market(market_id)
    FarMar::Market.vendors(market_id)
  end
end
