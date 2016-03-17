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

  def self.get_by(type, id)
    self.all.find_all do |sale|
      if type == "vendor"
        sale.vendor_id == id
      elsif type == "product"
      sale.product_id == id
      end
    end
  end

  # return an array of all instances within a certain time range
  def self.between(beginning_time, end_time)
    # convert strings to Time objects by parsing
    begins = DateTime.parse(beginning_time)
    ends = DateTime.parse(end_time)

    # find all instances within the begin..end range and return array
    self.all.find_all do |sale|
      (begins..ends).cover?(DateTime.parse(sale.purchase_time))
    end
  end

  def vendor
    FarMar::Vendor.find(vendor_id)
  end

  def product
    FarMar::Product.find(product_id)
  end
end