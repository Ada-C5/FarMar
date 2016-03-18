class FarMar::Product < FarMar::SharedStuff
  attr_reader :name, :vendor_id, :product_id
  def initialize(line) #for all, csv length -1?
    @product_id = line[0].to_i
    @name = line[1].to_s
    @vendor_id = line[2].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/products.csv')
  end

  def self.make_new_instance(instance)
    FarMar::Product.new(instance)
  end

  def vendor
    vendor = FarMar::Vendor.all.select {|vendor_id, instance| instance.vendor_id == self.vendor_id}
    return vendor.values[0]
  end

  def sales
    FarMar::Sale.all.select{|sid, instance| instance.product_id == self.product_id}
  end

  def number_of_sales
    sales.length
  end

  def self.by_vendor(vendor_id)
    FarMar::Product.all.select{|vid, instance| instance.vendor_id == vendor_id}
  end

end
