class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  extend FarMar::FarMarMethods

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @amount = info_hash[:amount].to_i
    @purchase_time = info_hash[:purchase_time]
    @vendor_id = info_hash[:vendor_id].to_i
    @product_id = info_hash[:product_id].to_i
  end

  def self.all(file = './support/sales.csv')
    sale_keys = [:id, :amount, :purchase_time, :vendor_id, :product_id]

    make_all(file, sale_keys)
  end

  def self.by_vendor(id_of_vendor)
    self.all.find_all do |sale|
      sale.vendor_id == id_of_vendor
    end
  end

  def self.by_product(id_of_product)
    self.all.find_all do |sale|
      sale.product_id == id_of_product
    end
  end

  def vendor
    FarMar::Vendor.find(vendor_id)
  end

  def product
    FarMar::Product.find(product_id)
  end
end