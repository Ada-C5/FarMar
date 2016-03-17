class FarMar::Sale
  attr_reader :sale_id, :ammount, :vendor_id, :product_id
  attr_accessor :purchase_time

  def initialize(id, ammount, purchase_time, vendor_id, product_id)
    @sale_id = id
    @ammount = ammount #Money.new(ammount, "USD")
    @purchase_time = DateTime.parse(purchase_time)
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    CSV.read('support/sales.csv').collect { |row| self.new(row[0].to_i,row[1].to_i,row[2],row[3].to_i,row[4].to_i) }
  end

  def self.find(id)
    FarMar::Sale.all.each do |sale|
      if sale.sale_id == id.to_i
        return sale
      end
    end
  end

  def vendor
    # returns the FarMar::Vendor instance that is associated with this sale
    #using the FarMar::Sale vendor_id field
    FarMar::Vendor.all.each do |vendor|
      if vendor.vendor_id == vendor_id.to_i
        return vendor
      end
    end
  end

  def product
    #returns the FarMar::Product instance that is associated with this sale,
    # using the FarMar::Sale product_id field
    FarMar::Product.all.each do |product|
      if product.product_id == product_id.to_i
        return product
      end
    end
  end

  def self.between(beginning_time, end_time)
    beginning_time = DateTime.parse(beginning_time)
    end_time = DateTime.parse(end_time)
    time_tres = DateTime.parse("10839,1934,2013-11-12 20:33:07 -0800,2443,7439")

    # #returns a collection of FarMar::Sale objects,
    # # where the purchase time is between the two times given as arguments
    # #get into each sale,
    # sales_in_a_range = []
    #   #compare if the purchase time of the test, is included in the given range. Cover?
    #   # if true, give it to me!!!!
    # end

    FarMar::Sale.all.select do |sale|
    (beginning_time..end_time).cover?(sale.purchase_time)
        # sales_in_a_range << sale
    end
    # return sales_in_a_range.length
  end

end
