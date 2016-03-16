class FarMar::Sale

  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(info={})
    @id = info[:id].to_i
    @amount = info[:amount].to_f
    @purchase_time = info[:purchase_time]
    @vendor_id = info[:vendor_id].to_i
    @product_id = info[:product_id].to_i
  end

  def self.all(file = "./support/sales.csv")
    sale_array = []
    sale = CSV.read(file)
    sale.map do |line|
      hash = {
        :id => line[0],
        :amount => line[1],
        :purchase_time => line[2],
        :vendor_id => line[3],
        :product_id => line[4]
      }
      sale_array << FarMar::Sale.new(hash)
    end
    return sale_array
  end

  def self.find(id)
    sales = self.all
    sales.each do |found_sale|
      return found_sale if id == found_sale.id
    end
    return nil
  end

  def self.by_vendor(vendor_id)
    sale = []
    sales = self.all
    sales.each do |found_sale|
      sale << found_sale if vendor_id == found_sale.vendor_id
    end
    return sale
  end

  def self.by_product(product_id)
    sales = []
    sale = self.all
    sale.each do |found_sales|
      sales << found_sales if product_id == found_sales.product_id
    end
    return sales
  end

  def vendor
    vendor = self.vendor_id
    return FarMar::Vendor.find(vendor)
  end

  def product
    product = self.product_id
    return FarMar::Product.find(product)
  end

  def self.between(beginning_time, end_time)
    
  end




end
