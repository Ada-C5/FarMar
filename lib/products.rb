class FarMar::Product
  attr_accessor :product_id, :product_name, :vendor_id

  def initialize(id, name, vendor_id)
    @product_id = id
    @product_name = name
    @vendor_id = vendor_id
  end

  def self.all
    all_products = CSV.read('support/products.csv').collect { |row| self.new(row[0].to_i,row[1],row[2].to_i) }
    return all_products
  end

  def self.find(id)
    FarMar::Product.all.each do |product|
      if product.product_id == id.to_i
        return product
      end
    end
  end

  def vendor
    #returns the FarMar::Vendor instance that is associated with
    #this vendor, using the FarMar::Product vendor_id field
    the_vendor = FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id.to_i }
    return the_vendor
  end

  def sales
    #returns a collection of FarMar::Sale instances that are
    #associated using the FarMar::Sale product_id field.
    saless = FarMar::Sale.all.select { |sale| sale.product_id == product_id.to_i }
    return saless
  end
end
