class FarMar::Product

  attr_reader :id, :name, :vendor_id

	def initialize(product_hash)
    # ID - (Fixnum) uniquely identifies the product
    # Name - (String) the name of the product (not guaranteed unique)
    # vendor_id - (Fixnum) a reference to which vendor sells this product

    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
	end

  def self.all(path_to_csv)
    product_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
      id = row[0]
      name = row[1]
      vendor_id = row[2]

      product_hash = {id: id, name: name, vendor_id: vendor_id}
      product_list << self.new(product_hash)
    end
    product_list
  end

  def self.find(id)
    products_to_search = FarMar::Product.all("./support/products.csv")
    product_to_return = nil

    products_to_search.each do |product|
      if product.id == id.to_s
        product_to_return = product
      end
    end
    product_to_return
  end

  # vendor: returns the FarMar::Vendor instance that is associated with this vendor using the 
  # FarMar::Product vendor_id field
  def vendor
    FarMar::Vendor.find(self.vendor_id)
  end

  # sales: returns a collection of FarMar::Sale instances that are associated using the 
  # FarMar::Sale product_id field.
  def sales
    sales_to_search = FarMar::Sale.all("./support/sales.csv")
    sales_to_search.select {|sale| sale.product_id == self.id}
  end


  # number_of_sales: returns the number of times this product has been sold.
  def number_of_sales
    sales_to_search = FarMar::Sale.all("./support/sales.csv")
    sales_to_search.count {|sale| sale.product_id == self.id}
  end

  # self.by_vendor(vendor_id): returns all of the products with the given vendor_id
  def self.by_vendor(vendor_id)
    products_to_search = FarMar::Product.all("./support/products.csv")
    products_to_search.select {|product| product.vendor_id == vendor_id.to_s}

  end

end