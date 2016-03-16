class FarMar::Product
  attr_accessor :product_id, :product_name, :vendor_id

  def initialize(id, name, vendor_id)
    @product_id = id
    @product_name = name
    @vendor_id = vendor_id
  end

  def self.all
     CSV.read('support/products.csv').collect { |row| self.new(row[0].to_i,row[1],row[2].to_i) }
  end

  def self.find(id)
    # returns an instance of the object where the value of the id field
    #in the CSV matches the passed parameter.
    FarMar::Product.all.each do |product|
      if product.product_id == id.to_i
        return product
      end
    end
  end

  def vendor
    #returns the FarMar::Vendor instance that is associated with
    #this vendor, using the FarMar::Product vendor_id field
    FarMar::Vendor.all.select { |vendor| vendor.vendor_id == vendor_id.to_i }
  end

  def sales
    #returns a collection of FarMar::Sale instances that are
    #associated using the FarMar::Sale product_id field.
    FarMar::Sale.all.select { |sale| sale.product_id == product_id.to_i }
  end

  def number_of_sales
    #returns the number of times this product has been sold.
    sales.length 
  end

  def self.by_vendor(vendor_id_given)
    FarMar::Product.all.select { |product| product.vendor_id == vendor_id_given.to_i }
  end
end
