require_relative '../farmar'

class FarMar::Product

  def initialize(id, name, vendor_id)
    @id         = id #product ID
    @name       = name
    @vendor_id  = vendor_id
  end

  def self.all
    all_products = CSV.read("./support/products.csv", "r")
    all_products.collect do |individual_array|
      @id           = individual_array[0]
      @name         = individual_array[1]
      @vendor_id    = individual_array[2]
      self.new(@id, @name, @vendor_id)
    end
  end

  def self.find(id)
    all_products = CSV.read("./support/products.csv", "r")
    all_products.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        return self.new(individual_array[0], individual_array[1], individual_array[2])
      end
    end
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
  def vendor
    FarMar::Vendor.find(@vendor_id)
  end

  #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
  def sales
    FarMar::Sale.product_sales(@id)
  end

  #number_of_sales: returns the number of times this product has been sold.
  def number_of_sales
    FarMar::Sale.product_sales(@id).length
  end

  # self.by_vendor(vendor_id): returns all of the productsvendors with the given vendormarket_id
  def self.by_vendor(vendor_id)
    all_products = CSV.read("./support/products.csv", "r")
    product_array = []
    all_products.collect do |individual_array|
      if individual_array[2].to_f == vendor_id.to_f
        product = self.new(individual_array[0].to_f, individual_array[1], individual_array[2].to_f)
        product_array << product
      end
    end
    product_array
  end


private
  def self.vendor_products(vendor_id)   #used by the Vendor.products method
    all_products = CSV.read("./support/products.csv", "r")
    product_array = []
    all_products.each do |individual_array|
      if individual_array[2].to_f == vendor_id.to_f
        product = self.new(individual_array[0], individual_array[1], individual_array[2])
        product_array << product
      end
    end
    product_array
  end

end
