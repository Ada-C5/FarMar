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
    sales_to_search = FarMar::Sale.all(FarMar::SALES_CSV)
    sales_to_search.find {|sale| sale.id == id.to_s}
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
  def self.between(beginning_time, end_time)
    sales_to_search = FarMar::Sale.all(FarMar::SALES_CSV)
    beginning_time = Time.parse(beginning_time).utc
    end_time = Time.parse(end_time).utc
    # earliest = Time.parse(beginning_time).utc
    # latest = Time.parse(end_time).utc

    sales_to_search.select do |sale|
      sale_time = Time.parse(sale.purchase_time).utc
      beginning_time <= sale_time && sale_time <= end_time
    end

  end

end