class FarMar::Product
  attr_reader :id, :name, :vendor_id

  # module mixin
  extend FarMar::FarMarMethods

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @vendor_id = info_hash[:vendor_id].to_i
  end

  def self.all(file = './support/products.csv')
    product_keys = [:id, :name, :vendor_id]

    make_all(file, product_keys)
  end

  # returns a lit of all products with the associated vendor_id
  def self.by_vendor(id_of_vendor)
    self.all.find_all do |product|
      product.vendor_id == id_of_vendor
    end
  end

  # returns a vendor instance associated with a particular product
  def vendor
    FarMar::Vendor.find(vendor_id)
  end

  # returns a list of all sales associated to product by product_id
  def sales
    FarMar::Sale.get_by("product", id)
  end

  def number_of_sales
    sales.length
  end
end