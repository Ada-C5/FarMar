class FarMar::Sale

	attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    # ID - (Fixnum) uniquely identifies the product
    # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
    # Purchase_time - (Datetime) when the sale was completed
    # Vendor_id - (Fixnum) a reference to which vendor completed the sale
    # Product_id - (Fixnum) a reference to which product was sold

    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all(path_to_csv)
    sale_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
      id = row[0]
      amount = row[1]
      purchase_time = row[2]
      vendor_id = row[3]
      product_id = row[4]

      sale_hash = {id: id, amount: amount, purchase_time: purchase_time, vendor_id: vendor_id, product_id: product_id}
      sale_list << self.new(sale_hash)
    end
    sale_list
  end

  def self.find(id)
    sales_to_search = FarMar::Sale.all("./support/sales.csv")

    sales_to_search.each do |sale|
      if sale.id == id.to_s
        return sale
      end
    end
  end

  # vendor: returns the FarMar::Vendor instance that is associated with this sale using 
  # the FarMar::Sale vendor_id field
  def vendor
    FarMar::Vendor.find(self.vendor_id)
  end

  # product: returns the FarMar::Product instance that is associated 
  # with this sale using the FarMar::Sale product_id field
  def product
    FarMar::Product.find(self.product_id)
  end


  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale 
  # objects where the purchase time is between the two times given as arguments

end